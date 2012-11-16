all: generator consumer


generator: generator.o
	g++ -Wall -g -o generator generator.o

generator.o: generator.cpp
	g++ -Wall -g -c generator.cpp

consumer: consumer.o
	g++ -Wall -g -o consumer consumer.o

consumer.o: consumer.cpp
	g++ -Wall -g -c consumer.cpp
