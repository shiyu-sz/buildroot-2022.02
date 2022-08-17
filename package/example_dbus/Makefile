
TARGET = dbus_send
TARGET_1 = dbus_recv
INCLUDES += -I./ \
			-I$(STAGING_DIR)/usr/include \
			-I$(STAGING_DIR)/usr/include/dbus-1.0/ \
			-I$(STAGING_DIR)/usr/lib/dbus-1.0/include/

CompileFlags += -g -c -Wall

SRCS = dbus_send.c
OBJS = $(SRCS:.c=.o)

SRCS_1 = dbus_recv.c
OBJS_1 = $(SRCS_1:.c=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lm -ldbus_interface

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

$(TARGET_1): $(OBJS_1)
	$(CC) -o $@ $(OBJS_1) $(LIBS) $(LDFLAGS)

all:$(TARGET) $(TARGET_1)

clean:
	rm -rf $(TARGET) $(TARGET_1) *.o *~
