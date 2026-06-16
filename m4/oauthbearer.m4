dnl Check for OAUTHBEARER (and therefore crypt)

AC_DEFUN([SASL_OAUTHBEARER_CHK],[

dnl OAUTHBEARER
 AC_ARG_ENABLE(oauthbearer, [  --enable-oauthbearer          enable OAUTHBEARER authentication [yes] ],
  oauthbearer=$enableval,
  oauthbearer=yes)

 AC_MSG_CHECKING(OAUTBEARER)
 if test "$oauthbearer" != no; then
  AC_MSG_RESULT(enabled)
  SASL_MECHS="$SASL_MECHS liboauthbearer.la"
  if test "$enable_static" = yes; then
    SASL_STATIC_OBJS="$SASL_STATIC_OBJS oauthbearer.o"
    SASL_STATIC_SRCS="$SASL_STATIC_SRCS \$(top_srcdir)/plugins/oauthbearer.c"
    AC_DEFINE(STATIC_OAUTHBEARER,[],[Link OAUTBEARER Staticly])
  fi
 else
  AC_MSG_RESULT(disabled)
 fi
])
