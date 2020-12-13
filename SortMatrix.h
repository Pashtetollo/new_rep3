#include <iostream>
#include <math.h>

using namespace std;

inline int  bubblesort_all_rows_by_descending(int i, int Arr[MATRIX_SIZE][MATRIX_SIZE])
	{
		for (int j = 0; j < MATRIX_SIZE; j++)
		{
			int x = 0;
			if (i < 1)
			{
				return 0;
			}
			for (int k = 0; k < i; k++)
			{
				if (Arr[k][j] < Arr[k + 1][j])
				{
					x = Arr[k][j];
					Arr[k][j] = Arr[k+1][j];
					Arr[k + 1][j] = x;
				}
			}
		}
		bubblesort_all_rows_by_descending(i - 1, Arr);
}

