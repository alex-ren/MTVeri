
RM=rm -rf

TARGET= peterson.so

INC := $(HOME)/programs/install/include

all: $(TARGET)


peterson.so: dlopen_peterson_impl.o peterson.o
	gcc -shared -o $@ $^

dlopen_peterson_impl.o: dlopen_peterson_impl.c
	gcc -c -I$(INC) -I. -std=c99 -fPIC $<

peterson.o: peterson.c
	gcc -c -I$(INC) -I. -std=c99 -fPIC $<

.PHONY: test_seq test_mc show

test_seq:
	pins2lts-seq peterson.so --strategy=scc --ltl="[]!(C0 == 1 && C1 == 1)" --trace=solution1.gcf

test_mc:
	pins2lts-mc peterson.so --invariant="!(C0 == 1 && C1 == 1)" --trace=solution2.gcf

show:
	ltsmin-printtrace solution1.gcf 2> /dev/null | grep action 

.PHONY: clean
clean:
	$(RM) *.o
	$(RM) *.so

cleanall: clean
	$(RM) *.gcf




