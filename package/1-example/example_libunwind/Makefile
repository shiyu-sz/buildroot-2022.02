
TARGET = example_libunwind
INCLUDES += -I./

CompileFlags += -ggdb3 -Wall -rdynamic

SRCS = main.c trace.c
OBJS = $(SRCS:.c=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lm -ldw -lunwind

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS) $(CompileFlags)

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
