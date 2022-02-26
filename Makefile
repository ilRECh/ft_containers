TARGET		:= test
CXX			:= clang++
CXXFLAGS	:= -Wall -Wextra -Werror -std=c++98 -g
SRC			:= main.cpp
OBJECTS		:= $(SRC:%.cpp=%.o)
INCLUDES	:= $(wildcard include/*.hpp)\ $(wildcard *.hpp)
INCLUDE		:= -I ./include

.PHONY: all clean fclean re

all: $(INCLUDES) $(TARGET)

%.o: %.cpp
	@$(CXX) $(CXXFLAGS) -c $< -o $@
	@echo $(CXX) $(CXXFLAGS) $(INCLUDE) $@

$(TARGET): $(OBJECTS)
	@$(CXX) $(CXXFLAGS) -o $(TARGET) $<
	@echo $(CXX) $(CXXFLAGS) $@

clean:
	-@rm -f $(OBJECTS)

fclean: clean
	-@rm -f $(TARGET)

re			: clean all
