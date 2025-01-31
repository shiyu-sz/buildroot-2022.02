
TARGET = libuci_interface.so
INCLUDES += -I./ -I$(STAGING_DIR)/usr/include/

CompileFlags += -g -Wall

SRCS = uci_interface.c
OBJS = $(SRCS:.c=.o)

LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lm -lubox -luci

%.o: %.c
	$(CC) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS) -fPIC -shared -DHAVE_CONFIG_H

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
