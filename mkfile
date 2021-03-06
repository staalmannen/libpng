</$objtype/mkfile
LIB=/$objtype/lib/ape/libpng.a
OFILES=pngread.$O example.$O pngtrans.$O pngrutil.$O pngwtran.$O pngwio.$O pngerror.$O \
	pngwrite.$O pngget.$O png.$O pngrio.$O pngwutil.$O pngmem.$O pngrtran.$O \
	pngpread.$O pngset.$O 
HFILES=pngpriv.h pngdebug.h pnginfo.h pngstruct.h pngconf.h pnglibconf.h png.h \
	pnglibconf.h 

</sys/src/cmd/mksyslib

CC=pcc
LD=pcc
CFLAGS=-c -I. -D_POSIX_SOURCE -D_SUSV2_SOURCE -D_BSD_EXTENSION -DHAVE_CONFIG_H -DPNGLIB_LIBNAME='PNG16_0'  -DPNGLIB_VERSION='1.6.38'  -DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS 

nuke:V:
	mk clean
	rm -f $LIB
	rm -f /sys/include/ape/png.h
	rm -f /sys/include/ape/pnglibconf.h
	rm -f /sys/include/ape/pngconf.h
	rm -f /rc/bin/ape/libpng-config
	cd contrib/pngminus  && mk nuke

install:V:
	cp libpngpf.3 /sys/man/3/libpngpf
	cp libpng.3 /sys/man/3/libpng
	cp png.h /sys/include/ape/
	cp pnglibconf.h /sys/include/ape/
	cp pngconf.h /sys/include/ape/
	cp libpng-config /rc/bin/ape/
	cd contrib/pngminus && mk install
	

