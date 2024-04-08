test1:
	gcc lab0test.c -o test -D test1
	./test < testfiles/input1.txt

test2:
	gcc lab0test.c -o test -D test2
	./test < testfiles/input2.txt

test3:
	gcc lab0test.c -o test -D test3
	./test < testfiles/input3.txt

test4:
	gcc lab0test.c -o test -D test4
	./test < testfiles/input4.txt

test5:
	gcc lab0test.c -o test -D test5
	./test < testfiles/input5.txt

clean:
	rm -rf test
	rm -rf lab0-upload.zip

commit:
	git add .
	git commit -m "update lab0"

zip:
	zip -r lab0-upload.zip testfiles

test:
	python3 coverage.py testfiles/testfile1.sy testfiles/testfile2.sy testfiles/testfile3.sy testfiles/testfile4.sy testfiles/testfile5.sy