#include <iostream>
#include <math.h>
#define MATRIX_SIZE int 5
using namespace std;
class MatrixInit
{
public:
	int Arr[MATRIX_SIZE][MATRIX_SIZE];
	MatrixInit()
	{
		for (int i = 0; i < MATRIX_SIZE; i++)
		{
			for (int j = 0; j < MATRIX_SIZE; j++)
			{
				this->Arr[i][j] = i * MATRIX_SIZE + j;
			}
		}
	};
	MatrixInit(char x)
	{
		for (int i = 0; i < MATRIX_SIZE; i++)
		{
			for (int j = 0; j < MATRIX_SIZE; j++)
			{
				cin >> this->Arr[i][j];
			}
		}
	}
	friend void output(int Arr[MATRIX_SIZE][MATRIX_SIZE]);
	friend float midArifSum(int Arr[MATRIX_SIZE][MATRIX_SIZE]);
	friend float midArif(int i, int Arr[MATRIX_SIZE][MATRIX_SIZE]);
	friend int  bubblesort(int i, int Arr[MATRIX_SIZE][MATRIX_SIZE]);
};

