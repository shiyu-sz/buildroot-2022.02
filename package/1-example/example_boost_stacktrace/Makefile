
TARGET = example_boost_stacktrace
INCLUDES += -I./ -I$(STAGING_DIR)/usr/include

CompileFlags += -ggdb3 -Wall -no-pie -fno-pie -rdynamic -DBOOST_STACKTRACE_USE_ADDR2LINE -Wl,--no-warn-search-mismatch

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-ldl -lboost_system -lboost_filesystem

%.o: %.cpp
	$(CXX) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CXX) -o $@ $(OBJS) $(LIBS) $(LDFLAGS) $(CompileFlags)

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
