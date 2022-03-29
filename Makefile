PREFIX ?= /usr/local
MAN_FILES = shappy.1

all: compress_man

compress_man:
.for man_file in ${MAN_FILES}
	gzip -f -k ${man_file}
.endfor

install:
	install -d ${DESTDIR}${PREFIX}/bin
	install -d ${DESTDIR}${PREFIX}/man/man1
	install -m 0755 shappy ${DESTDIR}${PREFIX}/bin
	.for man_file in ${MAN_FILES}
		install -m 0644 ${man_file}.gz ${DESTDIR}${PREFIX}/man/man1
	.endfor
