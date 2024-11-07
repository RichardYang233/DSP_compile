# Complie set

CC = gcc
AR = ar
CFLAGS = -std=c99 -Wall -g

# Include Dir

INCLUDES = -I./DSPLIB/Include -I./DSPLIB/Include/dsp -I./DSPLIB/PrivateInclude \
-I./Drivers/CMSIS/Device/ST/STM32H7xx/Include -I./Drivers/CMSIS/Include

# Source Dir

# SRC_DIRS := ./DSPLIB/Source/BasicMathFunctions \
# ./DSPLIB/Source/MatrixFunctions \
# ./DSPLIB/Source/FastMathFunctions \
# ./DSPLIB/Source/FilteringFunctions \
#  $(CMSIS_DSP)/Source/CommonTables \
#  $(CMSIS_DSP)/Source/InterpolationFunctions \
#  $(CMSIS_DSP)/Source/BayesFunctions 
#  $(CMSIS_DSP)/Source/ComplexMathFunctions \
#  $(CMSIS_DSP)/Source/QuaternionMathFunctions \
#  $(CMSIS_DSP)/Source/ControllerFunctions \
#  $(CMSIS_DSP)/Source/SVMFunctions \
#  $(CMSIS_DSP)/Source/DistanceFunctions \
#  $(CMSIS_DSP)/Source/StatisticsFunctions 
#  $(CMSIS_DSP)/Source/SupportFunctions 
#  $(CMSIS_DSP)/Source/TransformFunctions \
#  $(CMSIS_DSP)/Source/WindowFunctions

# Static Library

LIBRARY = libCMSISDSP.a

# Source

SRCS = $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))

# Object (.c --> .o) 

OBJS = $(patsubst %.c, %.o, $(SRCS))
OBJS_\PATH = $(subst /,\, $(OBJS))

# ---------------- #
# ---------------- #

# .PHONY: lib

# lib: $(LIBRARY)

# ---------------- #
# ---------------- #

.PHONY: run

run: main 
	./main.exe

main: $(LIBRARY) main.o
	@echo "linking..."
	$(CC) $(CFLAGS) -o $@ $^ -L. $<


# $(LIBRARY): $(OBJS)
# 	@echo "creating static library..."
#	$(AR) rcs $@ $(OBJS)

# 生成规则 (.c --> .o)

%.o: %.c
	@echo "compiling $<..."
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# ---------------- #
# ---------------- #

.PHONY: clean

clean: 
	del /s /q $(OBJS_\PATH) .\main.exe .\main.o


.PHONY: show

show:	
	@echo $(CFLAGS)
