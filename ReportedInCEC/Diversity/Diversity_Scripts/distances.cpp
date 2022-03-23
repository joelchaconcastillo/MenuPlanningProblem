#include <iostream>
#include <bits/stdc++.h>
#include <cmath>
int nvar, nss, npop;
double NOPT=3;
using namespace std;
struct Counter
{
  struct value_type { template<typename T> value_type(const T&) { } };
  void push_back(const value_type&) { ++count; }
  size_t count = 0;
};

template<typename T1, typename T2>
size_t intersection_size(const T1& s1, const T2& s2)
{
  Counter c;
  set_intersection(s1.begin(), s1.end(), s2.begin(), s2.end(), std::back_inserter(c));
  return c.count;
}
double getDistance(vector<double> &A, vector<double> &B) {
 	int ndias = A.size()/NOPT;	
	map<set<double>, int> f1;
	int dist = 0;
	for (int i = 0; i < ndias; i++){
		set<double> f;
		for(int j = 0; j < NOPT; j++)  f.insert(A[i*NOPT+j]);
		f1[f]++;
	}
	for (int i = 0; i < ndias; i++){
		set<double> f;
		for(int j = 0; j < NOPT; j++)  f.insert(B[i*NOPT+j]);
		if (f1.count(f)){
			f1[f]--;
			if (f1[f] == 0){
				f1.erase(f);
			}
		} else {
			dist++;
		}
	}
	return dist; ///((double)ndias);
}
vector<string> getfiles(char *pattern)
{
  //look for a list of files given a pattern...
  char tt[500];
  strcpy(tt, "/bin/ls ");
  strcat(tt, pattern);
  FILE *proc = popen(tt,"r");
  char buf[1024];
   vector<string> files;
  while ( !feof(proc) && fgets(buf,sizeof(buf),proc) )
  {
    string line(buf);
        line.pop_back();
    files.push_back(line);
  }
   return files;
}
double hypot(vector<double> &A, vector<double> &B)
{
   multiset< set<double> > indivA, indivB;
   for(int i = 0 ; i < A.size()/NOPT; i++)
   {
      set<double> tmp1, tmp2;
      for(int k = 0; k < NOPT; k++) 
	tmp1.insert(A[i*NOPT+k]);
      for(int k = 0; k < NOPT; k++) 
	tmp2.insert(B[i*NOPT+k]);
      indivA.insert(tmp1);
      indivB.insert(tmp2);
   }
///   for(int i = 0 ; i < A.size(); i++) {
///   cout << A[i]<< " "; 
///   if( (i+1)%3 ==0) cout << "| ";
///  }
///   cout << endl;
///   for(int i = 0 ; i < A.size(); i++) {
///	cout << B[i]<< " ";
///   if( (i+1)%3 ==0) cout << "| ";
///	}
///   cout << endl;


  vector< set<double> > result;
  set_intersection(indivA.begin(), indivA.end(), indivB.begin(), indivB.end(), std::inserter(result, result.begin()) );
//  for(int i = 0; i < result.size(); i++)
// {
//  for (auto it=result[i].begin(); it != result[i].end(); ++it) 
//        cout << ' ' << *it; 
//  cout  << endl;
// }
  return (A.size()/3.0 - result.size());///((double)A.size()/3.0);
}
int main(int argc, char **argv)
{
  vector <string> ff = getfiles(argv[1]);
  nss= atoi(argv[2]);//20
  npop = atoi(argv[3]);//10
  nvar = atoi(argv[4]);//days...
vector< vector<double> > dcn_run(ff.size(), vector<double> (nss, 0.0)), fitness(ff.size(), vector<double> (nss, 100000000)), lenratio(ff.size(), vector<double> (nss, 0));
//  vector< vector<double> > dcn_run(ff.size(), vector<double> (nss, 0.0)), fitness(ff.size(), vector<double> (nss, 0)), lenratio(ff.size(), vector<double> (nss, 0));
  for(int i = 0; i < ff.size(); i++) // each execution
  {
        FILE *summary = fopen(ff[i].c_str(), "r");
	cout << ff[i]<<endl;
        for(int k = 0; k < nss; k++) //each time
        {
           vector< vector< double> > information( npop, vector< double> ( nvar, 0.0)  );
        if(summary==NULL)
        {
//              cout <<"The file "<< ff[i].c_str()<<" cann't be opened.. "<<endl;
                exit(0);
        }
	double averagefitness = 0.0, best = 100000;
          for(int l = 0; l < npop; l++)
          {
            for(int o = 0; o < nvar; o++)
            {
                fscanf(summary, "%lf ",&information[l][o]);
            }
		double trash ;
                fscanf(summary, "%lf ",&trash);
                fscanf(summary, "%lf ",&trash);
		averagefitness +=trash;
		best = min(best, trash);
//		cout << trash <<endl;
		
//	    sort(information[l].begin(), information[l].end());
          }
	  //fitness[i][k] += averagefitness/npop;
	  fitness[i][k] = min(fitness[i][k], best);
	  lenratio[i][k] = (best <= 59.722 )?1:0;
          double mean = 0.0;
          for(int j = 0; j < npop; j++)
          {
             priority_queue<double> pq;
             double mean1=0.0;
             for(int q = 0; q < npop; q++)
             {
                if(j == q) continue;
                //pq.push(-hypot(information[j], information[q]));
                mean1 += hypot(information[j], information[q]);
	//	mean1 += getDistance(information[j], information[q]);
             }
             mean += mean1/((double)npop-1.0);
            // mean += -pq.top();
          }
          mean /=npop;
         dcn_run[i][k] = mean;
        }
          fclose(summary);
  } 
  //cout << nss << endl;
  vector<double> mean( nss, 0.0), meanfit( nss, 0.0), meanratio(nss,0.0);
  for(int i = 0; i < dcn_run.size(); i++)
  {
     for(int j = 0 ;j < dcn_run[i].size(); j++)
     {
         mean[j] +=dcn_run[i][j];
         meanfit[j] +=fitness[i][j];
         meanratio[j] += lenratio[i][j];
     }
  }

 for(int i = 0; i < nss; i++)
  {
        printf("%d %lf %lf %lf\n",i+1, mean[i]/ff.size(), meanfit[i]/ff.size(), meanratio[i]/ff.size());
  }
}
