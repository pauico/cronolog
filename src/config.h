/* Minimal config.h for Windows/MinGW */

#ifndef CONFIG_H
#define CONFIG_H

/* Define size types (optional, for Windows) */
#define SIZEOF_LONG 4
#define HAVE_STDINT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_FTIME 1

/* Define missing functions */
#define HAVE_GETTIMEOFDAY 0

/* Define to 1 if you have the `strptime' function. */
#define HAVE_STRPTIME 1

/* Define to 1 if `tm_zone' is a member of `struct tm'. */
/* #undef HAVE_STRUCT_TM_TM_ZONE */

/* Define to 1 if you have the <sys/stat.h> header file. */
/*#define HAVE_SYS_STAT_H 1*/

/* Define to 1 if you have the <sys/time.h> header file. */
/*#define HAVE_SYS_TIME_H 1*/

/* Define to 1 if you have the <sys/types.h> header file. */
/* #define HAVE_SYS_TYPES_H 1*/

/* Define to 1 if your `struct tm' has `tm_zone'. Deprecated, use
   `HAVE_STRUCT_TM_TM_ZONE' instead. */
/* #undef HAVE_TM_ZONE */

/* Define to 1 if you don't have `tm_zone' but do have the external array
   `tzname'. */
/* #define HAVE_TZNAME 1 */

/* Define to 1 if you have the <unistd.h> header file. */
/* Windows does not have unistd.h */
#define HAVE_UNISTD_H 0 

/* Define to 1 if you have the `vprintf' function. */
/* #define HAVE_VPRINTF 1*/

/* Define to 1 if `lstat' dereferences a symlink specified with a trailing
   slash. */
/* #undef LSTAT_FOLLOWS_SLASHED_SYMLINK */

/* Name of package */
#define PACKAGE "cronolog"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "A.Ford@ford-mason.co.uk"

/* Define to the full name of this package. */
#define PACKAGE_NAME "cronolog"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "cronolog 1.6.4"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "cronolog"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.6.4"

/* Define to 1 if the `S_IS*' macros in <sys/stat.h> do not work properly. */
/* #undef STAT_MACROS_BROKEN */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Define to 1 if your <sys/time.h> declares `struct tm'. */
/* #undef TM_IN_SYS_TIME */

/* Version number of package */
#define VERSION "1.6.4"

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to rpl_malloc if the replacement function should be used. */
/* #undef malloc */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef mode_t */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef pid_t */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */


#endif /* CONFIG_H */
