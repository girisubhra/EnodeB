############################################################################
#	                
#       @Copyright Mr. Subhra Prakash Giri
##############################################################################
CDIR		=.
CC              = gcc
DEFS            =
CFLAGS          = -g -c -o

OBJDIR          = $(CDIR)/obj
SRCDIR          = $(CDIR)/src
HDRDIR          = $(CDIR)/hdr
TARGET          = macsim_ENB
INCLUDE     	= -I$(HDRDIR)
####################################################################
SOURCES=$(SRCDIR)/mac_main.c \
        $(SRCDIR)/mac_init.c \
        $(SRCDIR)/mac_send.c \
        $(SRCDIR)/mac_recv.c


OBJS=$(SOURCES:.c=.o)

.c.o: $(SOURCES)
	$(CC) -Wall $(CFLAGS) $@ $(INCLUDE) $< $(DEFS)

TARGET: $(OBJS)
	$(CC) -Wall $(INCLUDE) -o $(TARGET) $(SRCDIR)/*.o
	mv $(SRCDIR)/*.o $(OBJDIR)

clean:
	rm -f $(TARGET)
	rm -f $(OBJDIR)/*.o
	rm -f $(SRCDIR)/*.o

