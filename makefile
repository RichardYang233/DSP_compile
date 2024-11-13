# Complie set

CC = g++
AR = ar
CFLAGS = -Wall -Wextra -std=c++11

# Include Dir

INCLUDES = -I./DSPLIB/Include -I./DSPLIB/Include/dsp -I./DSPLIB/PrivateInclude \
-I./Drivers/CMSIS/Device/ST/STM32H7xx/Include -I./Drivers/CMSIS/Include \
-I./dsppp/Include -I./dsppp/RTE/_Release_IPSS_M0P \
-I./CMSIS_5/Device/ARM/ARMCM0plus/Include

# Static Library

LIBRARY = libCMSISDSP.a

# Source

SRCS = $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))

# Object (.c --> .o) 

OBJS = $(patsubst %.c, %.o, $(SRCS))
OBJS_\PATH = $(subst /,\, $(OBJS))

# ----------------- #

.PHONY: run

run: main 
	./main.exe

main: $(LIBRARY) main.o
	@echo "linking..."
	$(CC) $(CFLAGS) -o $@ $^ -L. $<


# .c --> .o

%.o: %.c
	@echo "compiling $<..."
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

%.o: %.cpp
	@echo "compiling $<..."
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# ----------------- #

.PHONY: clean

clean: 
	del /s /q $(OBJS_\PATH) .\main.exe .\main.o


.PHONY: show

show:	
	@echo $(CFLAGS)
