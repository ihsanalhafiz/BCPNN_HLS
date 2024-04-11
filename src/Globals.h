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

#ifndef __Globals_included
#define __Globals_included

#include <vector>
#include <string>
#include <random>


namespace Globals {

    extern int simstep;
    extern float timestep,simtime;

    void error(std::string errloc,std::string errstr,int errcode = -1);
    void warning(std::string warnloc,std::string warnstr);
    void reset();
    void advance();
    void gsetpoissonmean(double mean) ;
    void gsetseed(long seed) ;
    int gnextint() ;
    float gnextfloat() ;
    int gnextpoisson() ;
    int argmax(float* vec,int i1,int n);
    int argmax(std::vector<float> vec,int i1,int n);
    int argmin(std::vector<float> vec,int i1,int n);
    float vlen(std::vector<float> vec) ;
    float vdiff(std::vector<float> vec1,std::vector<float> vec2) ;
    float vl1(std::vector<float> vec1,std::vector<float> vec2) ;
    void tofile(std::vector<float> vec,FILE *outfp);
    void tofile(std::vector<float> vec,std::string filename);
    void tofile(std::vector<std::vector<float> > mat,FILE *outfp);
    void tofile(std::vector<std::vector<float> > mat,std::string filename) ;
    void tofile(std::vector<int> vec,FILE *outfp);
    void tofile(std::vector<int> vec,std::string filename);
    void tofile(std::vector<std::vector<int> > mat,FILE *outfp);
    void tofile(std::vector<std::vector<int> > mat,std::string filename) ;

} ;

class RndGen {

public:
    
    long seed ;
    std::mt19937_64 generator ;
    std::uniform_real_distribution<float> uniformfloatdistr ;
    std::uniform_int_distribution<int> uniformintdistr ;
    std::poisson_distribution<int> poissondistr ;
    
    static RndGen *grndgen;
    RndGen(long seedoffs = -1) ;
    void setseed(long seed,int hcuid = -1) ;
    void setpoissonmean(float mean) ;
    long getseed() ;
    int nextint() ;
    float nextfloat() ;
    int nextpoisson() ;

} ;

#endif // __Globals_included
