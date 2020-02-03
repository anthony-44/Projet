export CC=g++
export CFLAGS=-W -Wall -std=c++11 -pedantic

main: main.o parser.o bloc.o Structure.o
	$(CC) -o main main.o parser.o bloc.o Structure.o $(CFLAGS)

main.o: main.cpp parser.hpp bloc.hpp Structure.hpp
	$(CC) -o main.o -I. -c main.cpp $(CFLAGS)

parser.o: parser.cpp parser.hpp
	$(CC) -o parser.o -I. -c parser.cpp $(CFLAGS)

bloc.o: bloc.cpp bloc.hpp
	$(CC) -o bloc.o -I. -c bloc.cpp $(CFLAGS)

Structure.o: Structure.cpp Structure.hpp
	$(CC) -o Structure.o -I. -c Structure.cpp $(CFLAGS)

clean:
	rm -rf *.o *~ main
