
TARGET = example_cpp
INCLUDES += -I./

CompileFlags += -g -c -Wall

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)

# 公用
LIBS +=  -L$(STAGING_DIR)/usr/lib \
	-lstdc++

%.o: %.cpp
	$(CXX) $(CFLAGS) $(INCLUDES) $(CompileFlags) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CXX) -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

all:$(TARGET)

clean:
	rm -rf $(TARGET) *.o *~
