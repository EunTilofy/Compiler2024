#include <stdio.h>
int read(void) {
	int r;
	scanf("%d", &r);
	return r;
}
void write(int n) {
	printf("%d\n", n);
}
#ifdef test1
#include "./testfiles/testfile1.sy"
#endif
#ifdef test2
#include "./testfiles/testfile2.sy"
#endif
#ifdef test3
#include "./testfiles/testfile3.sy"
#endif
#ifdef test4
#include "./testfiles/testfile4.sy"
#endif
#ifdef test5
#include "./testfiles/testfile5.sy"
#endif

