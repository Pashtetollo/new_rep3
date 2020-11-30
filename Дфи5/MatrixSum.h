#include <iostream>
#include <math.h>
using namespace std;
inline float midArif(int i, int Arr[5][5])
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


inline 	float midArifSum(int Arr[5][5])
	{
		float sumOfsum = 0;
		for (int i = 0; i < 5; i++)
		{
			int j = 0;
			float sum = 0;
			while (j < i)
			{
				sum = sum + Arr[i][j];
				j++;
			}
			sumOfsum = sumOfsum + sqrt(sum);
		}
		return sumOfsum;
	};

