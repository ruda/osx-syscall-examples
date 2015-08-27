ASM=		as -arch i386
LINKER=		ld -macosx_version_min 10.6
TARGETS=	sync exit hello libc.dylib

all: $(TARGETS)

sync: sync.s
	$(ASM) sync.s -o sync.o
	$(LINKER) sync.o -o sync

exit: exit.s
	$(ASM) exit.s -o exit.o
	$(LINKER) exit.o -o exit

hello: hello.s
	$(ASM) hello.s -o hello.o
	$(LINKER) hello.o -o hello

%.dylib: %.o
	$(CC) -dynamiclib $< -o $@

clean:
	rm -f *.o *~

distclean: clean
	rm -f $(TARGETS)
