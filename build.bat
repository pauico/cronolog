gcc -O2 -Ilib -Iexternals/LibOb_strptime/src -o cronolog.exe src/cronolog.c src/cronoutils.c externals/LibOb_strptime/src/LibOb_strptime.c lib/strptime.c -D_WIN32 -lws2_32

:: https://nuwen.net/mingw.html compiler
