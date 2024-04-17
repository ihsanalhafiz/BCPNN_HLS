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

#ifndef __Pop_included
#define __Pop_included

#include <vector>
#include <string>
#include <random>
#include <cfloat>
#include <list>

#include "Globals.h"
#include "Prj.h"

class Prj;

class Pop {
    
public:
    
    static int npop;
    int id, rank, H, M, N;
    std::vector<Prj*> dends, axons;
    std::string actfn;
    float eps, again = -1; 
    float *lgi, *sup, *supinf, *act, *d_lgi, *d_sup, *d_supinf, *d_act, *noise, *d_noise;
    float *cumsum, *d_cumsum;
    int *spkidx, *d_spkidx;
    int ncorrect = 0;
    float tracc, teacc;

    Pop(int H, int M, std::string = "softWTA", float again = 1, int rank = 0);
    ~Pop();
    void allocate_memory();
    void store(std::string field, FILE*);
    float* getact();
    void resetsup();
    void setinput(float*);
    void start_send();
    void start_recv();
    void integrate();
    void inject_noise(float nampl);
    void updact();
    void resetncorrect();
    void compute_accuracy(float*);
    void settracc(int);
    void setteacc(int);
    
private:

} ;

#endif // __Pop_included
