
TARGET = example_backtrace
INCLUDES += -I./

CompileFlags += -ggdb3 -Wall -rdynamic

SRCS = main.c add.c dump.c
OBJS = $(SRCS:.c=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lm

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) $(LDFLAGS) $(CompileFlags)

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
