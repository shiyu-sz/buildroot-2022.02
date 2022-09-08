
TARGET = libdbus_interface.so
INCLUDES += -I./ \
			-I${STAGING_DIR}/usr/include \
			-I${STAGING_DIR}/usr/include/dbus-1.0/ \
			-I${STAGING_DIR}/usr/lib/dbus-1.0/include/

CompileFlags += -g -Wall

SRCS = dbus_interface.c
OBJS = $(SRCS:.c=.o)

LIBS +=  -L${STAGING_DIR}/usr/lib \
	-ldl -lm -ldbus-1

%.o: %.c
	$(CC) $(INCLUDES) $(CompileFlags) -fPIC -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS) -fPIC -shared -DHAVE_CONFIG_H

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
