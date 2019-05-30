#include <iostream>
#include <algorithm>
#include <ctime>
using namespace std;

template <int N>
struct StructF {
public:
	double data[N];
	StructF() {
		for (int i=0; i<N; i++)
			data[i] = rand();
	}
};

struct StructG { // FYI: does not delete memory, among other things.
public:
	double *data;  // Good enough for these experiments
	int N;
	StructG(int len) {
		N = len;
		data = new double [N];
		for (int i=0; i<N; i++)
			data[i] = rand();
	}
};

template <int N>
void f_value(StructF<N> ms) {
}

template <int N>
void f_ref(StructF<N> &ms) {
}

template <int N>
void f_ptr(StructF<N> *ms) {
}

void g_value(StructG ms) {
}

void g_ref(StructG &ms) {
}

void g_ptr(StructG *ms) {
}

const int SMALL = 10;
const int BIG = 100000000;
StructF<SMALL> fSmall;
StructF<BIG> fBig;
StructG gSmall(SMALL);
StructG gBig(BIG);

int main(int argc, char *argv[]) {
	const int ITERATIONS = 100000000;
	int i;
	clock_t start, end;
	
	start = clock();
	for (i=0; i<ITERATIONS; i++) f_value(fBig);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;
	
	start = clock();
	for (i=0; i<ITERATIONS; i++) f_ref(fBig);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;

	start = clock();
	for (i=0; i<ITERATIONS; i++) f_ptr(&fBig);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;

	start = clock();
	for (i=0; i<ITERATIONS; i++) f_value(fSmall);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;

	start = clock();
	for (i=0; i<ITERATIONS; i++) f_ref(fSmall);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;

	start = clock();
	for (i=0; i<ITERATIONS; i++) f_ptr(&fSmall);
	cout << float(clock() - start)/CLOCKS_PER_SEC << endl;

	return 0;
}
