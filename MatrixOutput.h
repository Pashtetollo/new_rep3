#include <iostream>
#include <math.h>

using namespace std;

inline void output(int Arr[MATRIX_SIZE][MATRIX_SIZE]) {
		for (int i = 0; i < MATRIX_SIZE ; i++)
		{
			for (int j = 0; j < MATRIX_SIZE ; j++)
			{
				cout << Arr[i][j] << " ";
			}
			cout << "\n";
		}
		cout << "\n";
	};

inline void input(int Arr[MATRIX_SIZE][MATRIX_SIZE])
	{
		for (int i = 0; i < MATRIX_SIZE; i++)
		{
			for (int j = 0; j < MATRIX_SIZE; j++)
			{
				cin >>Arr[i][j];
			}
		}
	}