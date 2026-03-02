
TARGET = example_uci
INCLUDES += -I./ -I$(STAGING_DIR)/usr/include/

CompileFlags += -g -c -Wall

SRCS = main.c
OBJS = $(SRCS:.c=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lm -luci_interface

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
