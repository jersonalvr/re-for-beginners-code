include(`commons.m4')void main()
{
	int sum, product; // _EN(`now variables are local in this function')_RU(`теперь переменные локальные в этой ф-ции')_ES(`ahora las variables son locales en esta función')

	f1(123, 456, &sum, &product);
	printf ("sum=%d, product=%d\n", sum, product);
};
