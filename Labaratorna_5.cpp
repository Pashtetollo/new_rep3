#include <iostream>
#include <math.h>
#include "MatrixSum.h"
#include "SortMatrix.h"
#include "MatrixInit.h"
#include "MatrixOutput.h"
using namespace std;
int main()
{
	cout << "input matrix (25 elements)" << endl;
	MatrixInit Myarray = MatrixInit('initialize of matrix elements');
	output(Myarray.Arr);
	bubblesort(MATRIX_SIZE, Myarray.Arr);
	output(Myarray.Arr);
	cout << midArifSum(Myarray.Arr) << " is a sum of mid ariphmeticals" << "\n";
	return 0;
	}
	