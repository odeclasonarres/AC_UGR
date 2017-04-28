#include <omp.h>
#include <algorithm>
#include <iostream>
#include <vector>

int main()
{
	int v;
	std::vector<int> a = {1, 2, 3, 4, 5, 6, 7};

	#pragma omp parallel for lastprivate(v)
	for (unsigned i = 0; i < a.size(); ++i)
	{
		int old = v;
		v = a[i];
		#pragma omp critical
		std::cout << "\thebra " << omp_get_thread_num() 
		          << ": v = a[" << i <<"] = " << old << " --> " << v << std::endl;
	}

	std::cout << "fuera de \"parallel for lastprivate(v)\" v = " << v << std::endl;
}
