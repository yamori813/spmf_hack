COPT=-I../../lzo-2.10/include -I../../lzo-2.10
LOPT=-L../../lzo-2.10/src/.libs -llzo2 -lc

splzo: splzo.c
	cc $(COPT) -c splzo.c
	cc $(LOPT) -o splzo splzo.o

clean:
	rm -rf *.o splzo
