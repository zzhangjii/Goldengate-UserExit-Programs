#-------------------------------------------------------------------#
# Copyright (c) 1995, 2013, Oracle and/or its affiliates. All rights reserved. 
#                                                                   #
#   Makefile For Linux                                              #
#                                                                   #
#   Usage:                                                          #
#       make                                                        #
#                                                                   #
#   Description:                                                    #
#       The module can be built for all databases                   #
#-------------------------------------------------------------------#

#-------------------------------------------------------------------#
#   VARIABLES:                                                      #
#          USERINCLUDES  : User include directives.                 #
#          MODULENAME    : Which module need to be built.           #
#          CC            : Compiler name.                           #
#          CFLAGS        : Compiler Flags to prepare object file.   #
#          LDFLAGS       : Compiler Flags to prepare shared Lib.    #
#-------------------------------------------------------------------#

CC = gcc
CFLAGS = -c -fPIC
LDFLAGS = -shared
MODULENAME = ddldemo
SRCFILE = $(MODULENAME).c
OBJFILE = $(MODULENAME).o
LIBFILE = $(MODULENAME).so

#-------------------------------------------------------------------#
# Actual compilation and shared library build                       #
#-------------------------------------------------------------------#

USERINCLUDES = -I../../

$(LIBFILE):$(OBJFILE)
	$(CC) $(LDFLAGS) $(OBJFILE) -o $(LIBFILE)

$(OBJFILE):$(SRCFILE)
	$(CC) $(CFLAGS) $(USERINCLUDES) $(SRCFILE) -o $(OBJFILE)

clean:
	rm -f $(OBJFILE) $(LIBFILE)
