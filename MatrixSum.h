#include <iostream>
#include <math.h>

using namespace std;

inline float midArif(int i, int Arr[MATRIX_SIZE][MATRIX_SIZE])
	{
		int j = 0;
		float sum = 0;
		while (j < i)
		{
			sum = sum + Arr[i][j];
			j++;
		}
		return sqrt(sum);
	};

inline float midArifSum (int Arr[MATRIX_SIZE][MATRIX_SIZE])
	{
		float sum_of_sum = 0;
		for (int i = 0; i < MATRIX_SIZE ; i++)
		{
			int j = 0;
			float sum = 0;
			while (j < i)
			{
				sum = sum + Arr[i][j];
				j++;
			}
			sum_of_sum = sum_of_sum + sqrt(sum);
		}
		return sum_of_sum;
	};

