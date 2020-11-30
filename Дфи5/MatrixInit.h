#include <iostream>
#include <math.h>
using namespace std;
class MatrixInit
{
public:
	int Arr[5][5];
	MatrixInit()
	{
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 5; j++)
			{
				this->Arr[i][j] = i * 5 + j;
			}
		}
	};
	MatrixInit(char x)
	{
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 5; j++)
			{
				cin >> this->Arr[i][j];
			}
		}
	}
	friend void output(int Arr[5][5]);
	friend float midArifSum(int Arr[5][5]);
	friend float midArif(int i, int Arr[5][5]);
	friend int  bubblesort(int i, int Arr[5][5]);
};

