#include <iomanip>
#include <iostream>
#include <chrono>
#include <random>

const int N = 1000;

int a[N][N], b[N][N], c[N][N];

void f1()
{
	std::cout << __FUNCTION__;
	for (int i = 0; i < N; ++i)
		for (int j = 0; j < N; ++j)
			for (int k = 0; k < N; ++k)
				a[i][j] = b[i][k] * c[k][j];
}

void f2()
{
	std::cout << __FUNCTION__;
	for (int i = 0; i < N; ++i)
		for (int k = 0; k < N; ++k)
			for (int j = 0; j < N; ++j)
				a[i][j] = b[i][k] * c[k][j];
}

void f3()
{
	std::cout << __FUNCTION__;
	for (int j = 0; j < N; ++j)
		for (int i = 0; i < N; ++i)
			for (int k = 0; k < N; ++k)
				a[i][j] = b[i][k] * c[k][j];
}

void f4()
{
	std::cout << __FUNCTION__;
	for (int j = 0; j < N; ++j)
		for (int k = 0; k < N; ++k)
			for (int i = 0; i < N; ++i)
				a[i][j] = b[i][k] * c[k][j];
}

void f5()
{
	std::cout << __FUNCTION__;
	for (int k = 0; k < N; ++k)
		for (int i = 0; i < N; ++i)
			for (int j = 0; j < N; ++j)
				a[i][j] = b[i][k] * c[k][j];
}

void f6()
{
	std::cout << __FUNCTION__;
	for (int k = 0; k < N; ++k)
		for (int j = 0; j < N; ++j)
			for (int i = 0; i < N; ++i)
				a[i][j] = b[i][k] * c[k][j];
}

template<class F> void test(F& f)
{
	std::cout << "function = ";
	
	auto start = std::chrono::high_resolution_clock::now();
	f();
	auto stop = std::chrono::high_resolution_clock::now();
	
	std::chrono::duration<double, std::milli> t = (stop - start);
	std::cout << "\t time = " << std::fixed << std::setprecision(2) << std::setw(8) 
	          << t.count() << "ms" << std::endl;
}

int main()
{
	test(f1);
	test(f2);
	test(f3);
	test(f4);
	test(f5);
	test(f6);
}
