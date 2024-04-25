//#include <stdio.h>
//#include <stdlib.h>
//#include <time.h>
#include "Prj.h"

// Function to generate random float numbers in a specific range
float rand_float(float min, float max) {
    return (float) rand() / (float) (RAND_MAX) * (max - min) + min;
}

// Main testbench
int main() {
    int Ni = 1000;  // Size of vectors and matrices
    int Nj = 1000;
    float alpha = 0.5;
    float beta = 1.2;
    float biasmul = 0.3;

    // Seed random number generator
    srand(time(NULL));

    // Allocate memory for the arrays
    float *d_bwsup = (float *)malloc(Nj * sizeof(float));
    float *d_Wij = (float *)malloc(Ni * Nj * sizeof(float));
    float *d_Xi = (float *)malloc(Ni * sizeof(float));
    float *d_Bj = (float *)malloc(Nj * sizeof(float));

    // Initialize inputs with random data
    for (int i = 0; i < Nj; i++) {
        d_bwsup[i] = rand_float(-1.0, 1.0);
        d_Bj[i] = rand_float(-1.0, 1.0);
        for (int j = 0; j < Ni; j++) {
            d_Wij[i * Ni + j] = rand_float(-1.0, 1.0);
        }
    }
    for (int i = 0; i < Ni; i++) {
        d_Xi[i] = rand_float(-1.0, 1.0);
    }

    // Call the HLS function
    depolarize_hls(d_bwsup, d_Wij, d_Xi, Ni, Nj, alpha, beta, d_Bj, biasmul);

    // Output result for verification
    printf("Results (first 10 entries):\n");
    for (int i = 0; i < 10; i++) {
        printf("d_bwsup[%d] = %f\n", i, d_bwsup[i]);
    }

    // Clean up
    free(d_bwsup);
    free(d_Wij);
    free(d_Xi);
    free(d_Bj);

    return 0;
}
