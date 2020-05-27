#ifndef FUNC_H
#define FUNC_H

double factorial(double n) 
{
	double x; double f=1;
	
	for (x=1; x<=n; x++) { 
		f *= x; 
	}
	
	return f;
}


int modulo(double x, double y) 
{
	return (int)x % (int)y;
}

#endif