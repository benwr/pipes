CC	= g++
CFLAGS	= -Wall -g

all: dispatcher generator consumer

clean: 
	rm -f *.o core

exclean: clean
	rm -f generator consumer dispatcher

dispatcher: dispatcher.o
	${CC} ${CFLAGS} -o dispatcher dispatcher.o

dispatcher.o: dispatcher.cpp
	${CC} ${CFLAGS} -c dispatcher.cpp

generator: generator.o
	${CC} ${CFLAGS} -o generator generator.o

generator.o: generator.cpp
	${CC} ${CFLAGS} -c generator.cpp

consumer: consumer.o
	${CC} ${CFLAGS} -o consumer consumer.o

consumer.o: consumer.cpp
	${CC} ${CFLAGS} -c consumer.cpp
