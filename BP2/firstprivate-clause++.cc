#include <omp.h>
#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main()
{
	int suma = 0;
	std::vector<int> a = {0, 1, 2, 3, 4, 5, 6};

	#pragma omp parallel firstprivate(suma)
	{
		int viejo = suma;
		
		#pragma omp for
		for (unsigned i = 0; i < a.size(); ++i)
		{
			suma = suma + a[i];
			#pragma omp critical
			std::cout << "\thebra " << omp_get_thread_num()
			          << ": suma += a[" << i << "] = " << viejo 
			          << " --> " << suma << std::endl;
		}
	}

	std::cout << "fuera de \"parallel for firstprivate(suma)\" suma = " 
	          << suma << std::endl;
}
