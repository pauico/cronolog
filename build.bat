gcc -O2 -Ilib -o bin/cronolog.exe src/cronolog.c src/cronoutils.c lib/LibOb_strptime.c lib/strptime.c -D_WIN32 -lws2_32

:: https://nuwen.net/mingw.html compiler
