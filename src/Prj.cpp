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
#include "Globals.h"
#include "Prj.h"
#include <cstring>

using namespace std;
using namespace Globals;

int Prj::nprj = 0;

Prj::Prj(Pop *pop_i, Pop *pop_j, string lrule) {
    id = nprj++;
    this->pop_i = pop_i;
    this->pop_j = pop_j;
    this->Hi = pop_i->H;
    this->Mi = pop_i->M;
    this->Ni = pop_i->N;
    this->Hj = pop_j->H;
    this->Mj = pop_j->M;
    this->Nj = pop_j->N;
    this->Hij = Hj * Hi;
    this->Nij = Nj * Ni;
    this->lrule = lrule;
    ncorrect = 0; // if this is a classifier

    printf("\nNew Prj id = %d Pop[%d]->Pop[%d] lrule=%s", id, pop_i->id, pop_j->id, lrule.c_str());
    fflush(stdout);
}

Prj::~Prj() {
}

void Prj::set_eps(float paramval) { eps = paramval; }
void Prj::set_bgain(float paramval) { bgain = paramval; }
void Prj::set_wgain(float paramval) { wgain = paramval; }
void Prj::allocate_memory() {
    if (true) { // rewire = true
        updconn_nswap = (int*)malloc(Hj*sizeof(int));
        mutual_info = (float*)malloc(Hij*sizeof(float));
        score = (float*)malloc(Hij*sizeof(float));
        Connij = (int*)malloc(Hij*sizeof(int));
        WConnij = (int*)malloc(Nij*sizeof(int));
        fanout = (int*)malloc(Hi*sizeof(int));
        for (int hji=0; hji<Hij; hji++) 
            mutual_info[hji] = 0;
        for (int hji=0; hji<Hij; hji++) 
            score[hji] = 0;
        for (int hji=0; hji<Hij; hji++) 
            Connij[hji] = 1;
        for (int ji=0; ji<Nij; ji++) 
            WConnij[ji] = 1;

    }
}

void Prj::store(std::string field, FILE* f) {
    if (field == "bwsup") {
        fwrite(bwsup, sizeof(float), Nj, f);    
    } else if (field == "wij") {
        fwrite(Wij, sizeof(float), Nij, f);    
    } else if (field == "bj") {
        fwrite(Bj, sizeof(float), Nj, f);    
    } else if (field == "conn") {
        fwrite(Connij, sizeof(int), Hij, f);
    } else if (field == "wconn") {
        fwrite(WConnij, sizeof(int), Nij, f);   
    } else {
        printf("\nPrj::store Invalid field!");
    }
}

void add_bias(float *bwsup, float *b, float alpha, int N) {
    for (int n = 0; n < N; n++) {
        bwsup[n] += b[n] * alpha;
    }
}

void Prj::depolarize() {
    /* multiply pre-synaptic activity by weights and calculate dendrite's support to post-synaptic neuron */
    if (bwgain<eps) return;
    /* just an empty shell */
    if (lrule=="BCP") {
        printf("\nWARNING! Prj::depolarize trying to implement BCP function");
    } else if (lrule=="LSGD") {
        printf("\nWARNING! Prj::depolarize trying to implement LSGD function");
    } else {
        printf("\nWARNING! Prj::updtraces lrule not valid!");
    }
}

void Prj::updtraces() {
    /* just an empty shell */
    if (lrule=="BCP") {
        printf("\nWARNING! Prj::updtraces trying to implement BCP function!");
    } else if (lrule=="LSGD") {
        printf("\nWARNING! Prj::updtraces trying to implement LSGD function!");
    } else {
        printf("\nWARNING! Prj::updtraces lrule not valid!");
    }
}

void Prj::updbw() {
    if (printnow<eps) return;
    /* just an empty shell */
    if (lrule=="BCP") {
        printf("\nWARNING! Prj::updbw trying to implement BCP function!");
    } else if (lrule=="LSGD") {
        printf("\nWARNING! Prj::updbw trying to implement LSGD function!");
    } else {
        printf("\nWARNING! Prj::updbw lrule not valid!");   
    } 
}

void updwconn_kernel_cpu(int *WConnij, int *Connij, int Hi, int Mi, int Hj, int Mj) {
    int Ni = Hi * Mi;
    for (int hi = 0; hi < Hi; hi++) {
        for (int hj = 0; hj < Hj; hj++) {
            for (int mj = 0; mj < Mj; mj++) {
                for (int ms = 0; ms < Mi; ms++) {
                    int r = hj * Mj + mj;
                    int s = hi * Mi + ms;
                    int i = r*Ni + s;
                    WConnij[i] = Connij[hj*Hi+hi] == 1;
                }
            }
        }
    }
}

void Prj::initconn_rand(int nconn) {
    this->nconn = nconn;
    
    std::vector<int> shuffled(Hi);
    for (size_t hi = 0; hi < Hi; hi++)
        shuffled[hi] = hi;
    for (size_t hj = 0; hj < Hj; hj++) {
        shuffle(begin(shuffled), end(shuffled), RndGen::grndgen->generator);
        for (size_t id = 0; id < Hi; id++) {
            int hi = shuffled[id];
            Connij[hj*Hi + hi] = (id < this->nconn) ? 1 : 0;
        }
    }
    // No need for GPU memory operations, directly update wconn
    updwconn_kernel_cpu(WConnij, Connij, Hi, Mi, Hj, Mj);
}

void Prj::initconn_sqr(int nconn) {
    /* initialize square receptive fields connections as active */
    this->nconn = nconn;

    int Wj = int(sqrt(Hj)); // width & height of output layer
    int Wi = int(sqrt(Hi)); // weidth & heright of input layer
    int Wf = int(sqrt(nconn)); // weidth & height of filter
    int stride = int(Wi/Wj); 

    if (not Wi * Wi == Hi) printf("\nWarning! Hi not square but fitting as 2D square");
    if (not Wj * Wj == Hj) printf("\nWarning! Hj not square but fitting as 2D square");
    if (not Wf * Wf == nconn) printf("\nWarning! nconn not square but fitting as 2D square");
    if (not stride * Wj == Wi) printf("\nWarning! input size should be multiple of output");
    
    for (int hji=0; hji<Hij; hji++) 
        Connij[hji] = 0;

    for (int wj=0; wj<Wj; wj++) {
        for (int lj=0; lj<Wj; lj++) {
            int hj = wj + lj * Wj;
            for (int wi=wj*stride; wi<=wj*stride+Wf; wi++) {
                for (int li=lj*stride; li<=lj*stride+Wf; li++) {
                    int wi_mod = (wi > 0 ? wi : 0) < Wi ? wi : Wi-1;
                    int li_mod = (li > 0 ? li : 0) < Wi ? li : Wi-1;
                    int hi = wi_mod + li_mod * Wi;
                    Connij[hj*Hi+hi] = 1;
                }
            }
        }
    }
    updwconn_kernel_cpu(WConnij, Connij, Hi, Mi, Hj, Mj);
}

void Prj::updconn() {
    if (not REWIRE) return;

    /* just an empty shell */
    if (lrule=="BCP") {
        printf("\nWARNING! Prj::updconn trying to implement BCP function!");
    } else if (lrule=="LSGD") {
        printf("\nWARNING! Prj::updconn trying to implement LSGD function!");
    } else {
        printf("\nWARNING! Prj::updconn lrule not valid!");   
    }
}

/*-------------------------------------  BCP  ----------------------------------*/

BCP::BCP(Pop* pop_i, Pop* pop_j, std::string lrule) : Prj(pop_i, pop_j, lrule) {
}

void BCP::set_taup(float paramval) {
    taup = paramval;
    taupdt = Globals::timestep / paramval;
}

void BCP::allocate_memory() {
    Prj::allocate_memory();

    Xi = (float*)malloc(Ni*sizeof(float));
    Bj = (float*)malloc(Nj*sizeof(float));
    Wij = (float*)malloc(Nij*sizeof(float));
    bwsup = (float*)malloc(Nj*sizeof(float));
    P = eps;    
    Pi = (float*)malloc(Ni*sizeof(float));
    Pj = (float*)malloc(Nj*sizeof(float));
    Pij = (float*)malloc(Nij*sizeof(float));

    for (int s=0; s<Ni; s++) 
        Xi[s] = 1./Mi;
    for (int r=0; r<Nj; r++) 
        Bj[r] = eps;
    for (int ji=0; ji<Nij; ji++) 
        Wij[ji] = 0; // 0.1 * (gnextfloat() - 0.1); // eps*eps;
    for (int r=0; r<Nj; r++) 
        bwsup[r] = 0;
    for (int s=0; s<Ni; s++) 
        Pi[s] = eps;
    for (int r=0; r<Nj; r++) 
        Pj[r] = eps;
    for (int ji=0; ji<Nij; ji++) 
        Pij[ji] = eps*eps;

    P =  Mi * Mj * 10;
    Globals::gsetpoissonmean(P / Mi);
    for (int i = 0; i < Ni; i++) {
        Pi[i] = 1 + Globals::gnextpoisson();
    }
    Globals::gsetpoissonmean(P / Mj);
    for (int j = 0; j < Nj; j++) {
        Pj[j] = 1 + Globals::gnextpoisson();
    }
    Globals::gsetpoissonmean(P / (Mi * Mj));
    for (int k = 0; k < Ni * Nj; k++) {
        Pij[k] = 1 + Globals::gnextpoisson();
    }
    for (int hi = 0; hi < Hi; hi++) {
        float hsum = 0;
        for (int i = hi * Mi; i < (hi + 1) * Mi; i++)
            hsum += Pi[i];
        if (hsum > 0) {
            for (int i = hi * Mi; i < (hi + 1) * Mi; i++) {
                Pi[i] = Pi[i] / hsum * taupdt;
            }
        }
    }
    for (int hj = 0; hj < Hj; hj++) {
        float hsum = 0;
        for (int j = hj * Mj; j < (hj + 1) * Mj; j++)
            hsum += Pj[j];
        if (hsum > 0) {
            for (int j = hj * Mj; j < (hj + 1) * Mj; j++) {
                Pj[j] = Pj[j] / hsum * taupdt;
            }
        }
    }
    for (int hi = 0; hi < Hi; hi++) {
        for (int hj = 0; hj < Hj; hj++) {
            float hijsum = 0;
            for (int i = hi * Mi; i < (hi + 1) * Mi; i++) {
                for (int j = hj * Mj; j < (hj + 1) * Mj; j++) {
                    hijsum += Pij[i * Nj + j];
                }
            }
            for (int i = hi * Mi; i < (hi + 1) * Mi; i++) {
                for (int j = hj * Mj; j < (hj + 1) * Mj; j++) {
                    Pij[i * Nj + j] = Pij[i * Nj + j] / hijsum * taupdt;
                }
            }
        }
    }
    P = taupdt;
}

void BCP::store(std::string field, FILE* f) {
    if (field == "pij") {
        fwrite(Pij, sizeof(float), Nij, f);
    } else if (field == "pi") {
        fwrite(Pi, sizeof(float), Ni, f);
    } else if (field == "pj") {
        fwrite(Pj, sizeof(float), Nj, f);
    } else if (field == "mi") {        
        fwrite(mutual_info, sizeof(float), Hij, f);  
    } else if (field == "nmi") {
        fwrite(score, sizeof(float), Hij, f);   
    } else if (field == "updconn_nswap") {
        fwrite(updconn_nswap, sizeof(int), Hj, f);   
    } else {
        Prj::store(field, f);
    }
}

void BCP::depolarize() {
    /* Multiply pre-synaptic activity by weights and calculate dendrite's support to post-synaptic neuron */
    if (bwgain < eps) return;  
    float alpha = 1; // Multiplier for synaptic current
    float beta = 0; // Multiplier for previous support term
    float biasmul = 1; // Multiplier for bias term

    // perform gemv operation: bwsup = alpha * Wij * Xi + beta * bwsup
    // with Ni = number of rows, Nj = number of columns

    for (int i = 0; i < Nj; i++) {
        bwsup[i] *= beta;
        for (int j = 0; j < Ni; j++) {
            bwsup[i] += alpha * Wij[j * Nj + i] * Xi[j];  // Accessing the transpose of Wij
        }
    }

    // Add bias using the provided add_bias function
    add_bias(bwsup, Bj, biasmul, Nj);
}


void updpi_kernel_cpu(float *xi, float *pi, float taupdt, int Ni, float PRN) {
    for (int i = 0; i < Ni; i++) {
        pi[i] += (xi[i] - pi[i]) * taupdt * PRN;
    }
}

void updpj_kernel_cpu(float *xj, float *pj, float taupdt, int Nj, float PRN) {
    for (int j = 0; j < Nj; j++) {
        pj[j] += (xj[j] - pj[j]) * taupdt * PRN;
    }
}

void updpij_kernel_cpu(float *xi, float *xj, float *pij, float taupdt, float eps, int Ni, int Nj, float PRN) {
    for (int i = 0; i < Ni; i++) {
        for (int j = 0; j < Nj; j++) {
            int ij = j * Ni + i;
            pij[ij] += (xi[i] * xj[j] - pij[ij]) * taupdt * PRN;
        }
    }
}

void BCP::updtraces() {
    float *Xj = pop_j->act; // Assuming this pointer can be directly used.
    if (printnow < eps) return;
    P += (1 - P) * taupdt * printnow;
    updpi_kernel_cpu(Xi, Pi, taupdt, Ni, printnow);
    updpj_kernel_cpu(Xj, Pj, taupdt, Nj, printnow);
    updpij_kernel_cpu(Xi, Xj, Pij, taupdt, eps, Ni, Nj, printnow);
}

void updbw_kernel_cpu(float p, float* pi, float* pj, float* pij, float* bj, float* wij, int* wconnij, float bgain, float wgain, int Ni, int Nj, float eps) {
    for (int j = 0; j < Nj; j++) {
        
        for (int i = 0; i < Ni; i++) {
            int ij = j * Ni + i;
            if(i == 0) {
                // Update bj only for the first i=0 for each j, mimicking the GPU behavior
                bj[j] = bgain * logf(pj[j] / p);
            }
            wij[ij] = wgain * logf(pij[ij] * p / (pi[i] * pj[j])) * wconnij[ij];
        }
    }
}

void BCP::updbw() {
    if (printnow < eps) return;
    updbw_kernel_cpu(P, Pi, Pj, Pij, Bj, Wij, WConnij, bgain, wgain, Ni, Nj, eps);
}

void calc_mutualinfo_kernel_cpu(float *mutual_info, float *Pi, float *Pj, float *Pij, float P, float eps, int Hi, int Mi, int Hj, int Mj) {
    int Ni = Hi * Mi;
    for (int hi = 0; hi < Hi; hi++) {
        for (int hj = 0; hj < Hj; hj++) {
            int hji = hj * Hi + hi;
            float tmpsum = 0;
            for (int mj = 0; mj < Mj; mj++) {
                for (int mi = 0; mi < Mi; mi++) {
                    int j = hj * Mj + mj;
                    int i = hi * Mi + mi;
                    int ji = j * Ni + i;
                    float Qi = fmax(Pi[i] / P, eps);
                    float Qj = fmax(Pj[j] / P, eps);
                    float Qij = fmax(Pij[ji] / P, eps * eps);
                    tmpsum += Qij * log(Qij / (Qi * Qj));
                }
            }
            mutual_info[hji] = tmpsum;
        }
    }
}

void compute_fanout_kernel_cpu(int *fanout, int *Connij, int Hi, int Hj) {
    for (int hi = 0; hi < Hi; hi++) {
        int tmpsum = 0;
        for (int hj = 0; hj < Hj; hj++){
            tmpsum += Connij[hj * Hi + hi] == 1;
        } 
        fanout[hi] = tmpsum;
    }
}

void recompute_score_kernel_cpu(float *score, float *mutual_info, int *fanout, int Hi, int Hj) {
    for (int hi = 0; hi < Hi; hi++) {
        for (int hj = 0; hj < Hj; hj++) {
            int hji = hj * Hi + hi;
            score[hji] = mutual_info[hji] / (fanout[hi] + 1);
        }
    }
}

void swap_kernel_cpu(int *Connij, float *score, int updconn_nswapmax, int* updconn_nswap, float updconn_threshold, int Hi, int hj) {
    bool converged = false;

    updconn_nswap[hj] = updconn_nswapmax;

    for (int swapid=0; swapid<updconn_nswapmax; swapid++) {

        if (converged) {
            updconn_nswap[hj] = swapid;
            break;
        }

        int active_id, silent_id;
        float active_minscore = FLT_MAX, silent_maxscore = -FLT_MAX;
        
        for (int hi=0; hi<Hi; hi++) {
            if (Connij[hj*Hi+hi]==1 and score[hj*Hi+hi] < active_minscore) {
                active_id = hi;
                active_minscore = score[hj*Hi+hi];
            }
            if (Connij[hj*Hi+hi]==0 and score[hj*Hi+hi] > silent_maxscore) {
                silent_id = hi;
                silent_maxscore = score[hj*Hi+hi];
            }
        }
        
        if (silent_maxscore > updconn_threshold * active_minscore) {
            Connij[hj*Hi + active_id] = 0;                
            Connij[hj*Hi + silent_id] = 1;
        } else {
            converged = true;
        }

    }    
}

void BCP::updconn() {
    if (not REWIRE) return;
    // Compute mutual information
    calc_mutualinfo_kernel_cpu(mutual_info, Pi, Pj, Pij, P, eps, Hi, Mi, Hj, Mj);
    for (int hj = 0; hj < Hj; hj++) {
        // (Re)compute score from mutual info
        compute_fanout_kernel_cpu(fanout, Connij, Hi, Hj);
        recompute_score_kernel_cpu(score, mutual_info, fanout, Hi, Hj);
        // Update connections
        swap_kernel_cpu(Connij, score, updconn_nswapmax, updconn_nswap, updconn_threshold, Hi, hj);
    }
    // (re)compute score from mutual info
    compute_fanout_kernel_cpu(fanout, Connij, Hi, Hj);
    recompute_score_kernel_cpu(score, mutual_info, fanout, Hi, Hj);

    updwconn_kernel_cpu(WConnij, Connij, Hi, Mi, Hj, Mj);
}

/*-------------------------------------  LSGD ----------------------------------*/
LSGD::LSGD(Pop* pop_i, Pop* pop_j, std::string lrule) : Prj(pop_i, pop_j, lrule) {
    d_target = nullptr;
    batch_size = 100;
    t = 0;
    // From Kingma & Ba, 2014
    beta1 = 0.9;
    beta2 = 0.999;
    epsilon = 1e-7f;
    alpha = 0.001;
}

void LSGD::allocate_memory() {
    Prj::allocate_memory();
    
    Xi = (float*)malloc(Ni*sizeof(float));
    Bj = (float*)malloc(Nj*sizeof(float));
    Wij = (float*)malloc(Nij*sizeof(float));
    Wij_transposed = (float*)malloc(Nij*sizeof(float));
    bwsup = (float*)malloc(Nj*sizeof(float));
    db = (float*)malloc(Nj*sizeof(float));
    m_db = (float*)malloc(Nj*sizeof(float));
    v_db = (float*)malloc(Nj*sizeof(float));
    m_db_corr = (float*)malloc(Nj*sizeof(float));
    v_db_corr = (float*)malloc(Nj*sizeof(float));
    dw = (float*)malloc(Nj*Ni*sizeof(float));
    m_dw = (float*)malloc(Nj*Ni*sizeof(float));
    v_dw = (float*)malloc(Nj*Ni*sizeof(float));
    m_dw_corr = (float*)malloc(Nj*Ni*sizeof(float));
    v_dw_corr = (float*)malloc(Nj*Ni*sizeof(float));
    
    for (int s=0; s<Ni; s++) 
        Xi[s] = 0;
    for (int r=0; r<Nj; r++) 
        Bj[r] = 0;
    for (int ji=0; ji<Nij; ji++) 
        Wij[ji] = 0;
    for (int r=0; r<Nj; r++) 
        bwsup[r] = 0;
    memset(db, 0, Nj*sizeof(float));
    memset(m_db, 0, Nj*sizeof(float));
    memset(v_db, 0, Nj*sizeof(float));
    memset(m_db_corr, 0, Nj*sizeof(float));
    memset(v_db_corr, 0, Nj*sizeof(float));
    memset(dw, 0, Nj*Ni*sizeof(float));
    memset(m_dw, 0, Nj*Ni*sizeof(float));
    memset(v_dw, 0, Nj*Ni*sizeof(float));
    memset(m_dw_corr, 0, Nj*Ni*sizeof(float));
    memset(v_dw_corr, 0, Nj*Ni*sizeof(float));

    for (int ji=0; ji<Nij; ji++) 
        Wij[ji] = gnextfloat() * 0.05;

}

void LSGD::store(std::string field, FILE* f) {
}

void LSGD::settarget(float* d_target = nullptr) {
    if (d_target!=nullptr) {
        this->d_target = d_target;
    }
}

void LSGD::depolarize() {
    /* Multiply pre-synaptic activity by weights and calculate dendrite's support to post-synaptic neuron */
    if (bwgain < eps) return;
    float alpha = 1; // Multiplier for synaptic current, assume pop_i->again is factored in elsewhere if needed
    float beta = 0; // Multiplier for previous support term 
    float biasmul = 1; // Multiplier for bias term

    // perform gemv operation: bwsup = alpha * Wij * Xi + beta * bwsup
    // with Ni = number of rows, Nj = number of columns

    for (int i = 0; i < Nj; i++) {
        bwsup[i] *= beta;
    }
    for (int i = 0; i < Nj; i++) {
        for (int j = 0; j < Ni; j++) {
            bwsup[i] += alpha * Wij[j * Nj + i] * Xi[j];  // Accessing the transpose of Wij
        }
    }
    // Add bias using the provided add_bias function
    add_bias(bwsup, Bj, biasmul, Nj);
}

void upd_traces_lsgd_cpu(float *db, float *dw, float *src, float *target, float *pred, int Ni, int Nj) {
    for (int r = 0; r < Nj; r++) {
        for (int s = 0; s < Ni; s++) {
            int rs = r * Ni + s;
            // Update db for the first element in each column
            if (s == 0) {
                db[r] += (target[r] - pred[r]);
            }
            // Update dw for all elements
            dw[rs] += src[s] * (target[r] - pred[r]);
        }
    }
}

void LSGD::updtraces() {
    if (d_target == nullptr) return;
    if (printnow < eps) return;
    float *srcact = Xi; // Pre-synaptic activity
    float *Xj = pop_j->act; // Post-synaptic activity (predictions, in this case)
    // Call the CPU version of the kernel function
    upd_traces_lsgd_cpu(db, dw, srcact, d_target, Xj, Ni, Nj);
}

void updbw_lsgd_cpu(float *b, float *db, float *m_db, float *v_db, float *m_db_corr, float *v_db_corr,
                    float *w, float *dw, float *m_dw, float *v_dw, float *m_dw_corr, float *v_dw_corr,
                    float alpha, float beta1, float beta2, float epsilon, float t, int batch_size, 
                    int Ni, int Nj) {
    for (int r = 0; r < Nj; r++) {
        for (int s = 0; s < Ni; s++) {
            int rs = r * Ni + s;
            // Update moment estimates for weights
            m_dw[rs] = beta1 * m_dw[rs] + (1 - beta1) * dw[rs] / (float) batch_size;
            v_dw[rs] = beta2 * v_dw[rs] + (1 - beta2) * dw[rs] * dw[rs] /  (float) batch_size;
            m_dw_corr[rs] = m_dw[rs] / (1 - pow(beta1, t));
            v_dw_corr[rs] = v_dw[rs] / (1 - pow(beta2, t));
            // Update weight parameters
            w[rs] = w[rs] + alpha * (m_dw_corr[rs] / (sqrt(v_dw_corr[rs]) + epsilon));
            if (s == 0) {
                // Update moment estimates for biases
                m_db[r] = beta1 * m_db[r] + (1 - beta1) * db[r] /  (float)batch_size;
                v_db[r] = beta2 * v_db[r] + (1 - beta2) * db[r] * db[r] /  (float)batch_size;
                m_db_corr[r] = m_db[r] / (1 - pow(beta1, t));
                v_db_corr[r] = v_db[r] / (1 - pow(beta2, t));
                // Update bias parameters
                b[r] = b[r] + alpha * (m_db_corr[r] / (sqrt(v_db_corr[r]) + epsilon));
            }
        }
    }
}

void LSGD::updbw() {
    if (printnow < eps) return;
    t++; // Increment time step for bias correction
    // Call the CPU version of the kernel function
    updbw_lsgd_cpu(Bj, db, m_db, v_db, m_db_corr, v_db_corr, Wij, dw, m_dw, v_dw, m_dw_corr, v_dw_corr, alpha, beta1, beta2, epsilon, t, batch_size, Ni, Nj);
    // Reset the gradients to zero for the next update
    memset(db, 0, Nj*sizeof(float));
    memset(dw, 0, Nij*sizeof(float));
}
