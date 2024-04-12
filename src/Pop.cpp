/*

MIT License

Copyright (c) 2024 Anders Lansner, Naresh Ravichandran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

#include <vector>
#include <string>
#include <random>
#include <iostream>
#include <algorithm> // For std::max
#include <cmath>     // For exp and other math functions
#include <cstring>

#include "Globals.h"
#include "Pop.h"

using namespace std;
using namespace Globals;

int Pop::npop = 0;

Pop::Pop(int H, int M, std::string actfn, float again, int rank) {
    id = npop++;
    this->H = H;
    this->M = M;
    this->N = H * M;    
    this->actfn = actfn;
    this->again = again;
    this->rank = rank;
    eps = 1e-7;
    printf("\nNew Pop id = %-5d H = %-5d M = %-5d N = %-5d again=%-.3f", id, H, M, N, this->again);
    fflush(stdout);
}

Pop::~Pop() {
    free(lgi);
    free(sup);
    free(act);
}

typedef struct {
    unsigned int seed;
} cpuRandState;

void setup_noise_cpu(cpuRandState *state, int N) {
    srand(time(NULL));
    for (int n = 0; n < N; ++n) {
        state[n].seed = rand();
    }
}

void Pop::allocate_memory() {
    lgi = (float*)malloc(N*sizeof(float));
    sup = (float*)malloc(N*sizeof(float));
    supinf = (float*)malloc(N*sizeof(float));
    act = (float*)malloc(N*sizeof(float));
    spkidx = (int*)malloc(H*sizeof(int));
    cumsum = (float*)malloc(N*sizeof(float));
    for (int i=0; i<N; i++) lgi[i] = 0; // logf(eps);
    for (int i=0; i<N; i++) sup[i] = logf(eps);
    for (int i=0; i<N; i++) supinf[i] = logf(eps);
    for (int i=0; i<N; i++) act[i] = eps;
    for (int h=0; h<H; h++) spkidx[h] = 0;
    for (int i=0; i<N; i++) cumsum[i] = 0;
}

void Pop::store(std::string field, FILE* f) {
    if (field == "act") {        
        fwrite(act, sizeof(float), N, f);        
    } else if (field == "lgi") {
        fwrite(lgi, sizeof(float), N, f);
    } else if (field == "sup") {
        fwrite(sup, sizeof(float), N, f);
    } else if (field == "supinf") {
        fwrite(supinf, sizeof(float), N, f);   
    } else {
        printf("\nPop::store Invalid field!");
    }
}

float* Pop::getact() {
    return act;
}

void Pop::resetsup() {
    memset(supinf, 0, N*sizeof(float));
    memset(act, 0, N*sizeof(float));
}

void setinput_to_zero_kernel_cpu(float* lgi, float eps, int N) {
    for (int n = 0; n < N; ++n) {
        lgi[n] = 0; // Or logf(eps) if needed
    }
}

void setinput_kernel_cpu(float* lgi, float* inp, float eps, int N) {
    for (int n = 0; n < N; ++n) {
        lgi[n] = logf(inp[n] + eps);
    }
}

void Pop::setinput(float *d_inp = nullptr) {
    if (d_inp == nullptr) {
        setinput_to_zero_kernel_cpu(lgi, eps, N);
    } else {
        setinput_kernel_cpu(lgi, d_inp, eps, N);
    }
}

void addtosupinf_kernel_cpu(float *supinf, float *inc, int N) {
    for (int n = 0; n < N; ++n) {
        supinf[n] += inc[n];
    }
}

void calcsup_kernel_cpu(float *sup, float *supinf, int N) {
    for (int n = 0; n < N; ++n) {
        sup[n] += (supinf[n] - sup[n]);
    }
}

void Pop::integrate() {
    /* Integrate all dendrite prj's support into pop's support */
    addtosupinf_kernel_cpu(supinf, lgi, N);
    for (int did = 0; did < dends.size(); did++) {
        Prj *dend = dends[did];
        if (dend->bwgain < eps) continue;
        addtosupinf_kernel_cpu(supinf, dend->bwsup, N);
        // No need to check for errors as in CUDA version
    }
    calcsup_kernel_cpu(sup, supinf, N);
}


void inject_noise_kernel_cpu(std::mt19937 &rng, float *sup, float nampl, int N) {
    std::uniform_real_distribution<float> dist(0.0f, 1.0f); // Uniform distribution between 0 and 1
    for (int n = 0; n < N; ++n) {
        sup[n] += nampl * dist(rng);
    }
}

void Pop::inject_noise(float nampl) {
    // Initialize a random number generator
    std::random_device rd; // Use to seed the random number engine
    std::mt19937 rng(rd()); // Standard mersenne_twister_engine seeded with rd()
    // Call the CPU version of the kernel function
    inject_noise_kernel_cpu(rng, sup, nampl, N);
}

void softmax_kernel_cpu(float* sup, float* act, float again, int H, int M) {
    for (int h = 0; h < H; ++h) {
        float maxsup = sup[M * h];
        for (int m = 0; m < M; ++m) maxsup = std::max(maxsup, sup[M * h + m]);
        float sumexpsup = 0;
        for (int m = 0; m < M; ++m) {
            act[M * h + m] = expf(sup[M * h + m] - maxsup) * again; // Apply gain here if needed
            sumexpsup += act[M * h + m];
        }
        for (int m = 0; m < M; ++m) act[M * h + m] /= sumexpsup;
    }
}

void Pop::updact() {
    if (actfn == "softmax") {
        softmax_kernel_cpu(sup, act, again, H, M);
    } else {
        std::cerr << "Pop::updact - Unknown actfn" << std::endl;
    }
}

void Pop::resetncorrect() {
    ncorrect = 0;
}

void Pop::compute_accuracy(float *target) {
    float *pred = this->act;
    // Increment ncorrect if the argmax (index of max value) of the target matches the pred.
    ncorrect += argmax(target, 0, N) == argmax(pred, 0, N);
}

void Pop::settracc(int ntrpat) {
    tracc = float(ncorrect) / ntrpat * 100.;
}

void Pop::setteacc(int ntepat) {
    teacc = float(ncorrect) / ntepat * 100.;
}
