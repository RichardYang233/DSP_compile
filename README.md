# README

### 概述

本文件用于编译 CMSIS-DSP库，并生成静态链接库。包含一个测试程序。

### 文件构成

| 文件名        | 描述                    |
| ------------- | ----------------------- |
| CMSIS_5       |                         |
| CMSIS-DSP     | DSP库源文件             |
| Drivers       |                         |
| DSPLIB        | DSP库中必要的头文件     |
| dsppp         | DSP++扩展，用于简化代码 |
| libCMSISDSP.a | 可用的静态链接库        |
| main.c        | 测试文件                |

### 生成静态链接库

**依赖**

+ CMake
+ CMSIS-DSP
+ VSCode扩展
  + CMake
  + CMake Language Support
  + CMake Tools

**生成流程**

1. 在 **CMSIS-DSP\Source\CMakeLists.txt** 中可以管理宏定义，开启 **HOST** 宏定义

   ```cmake
   option(HOST "Build for host" ON)
   ```

2. VSCode中使用快捷键：`Ctrl + Shift + P`，打开 **CMake：Config**，选择 **CMSIS-DSP\CMakeLists.txt**，等待生成 **.\build** 文件

3. 点击左下角 `生成`，生成静态链接库 [libCMSISDSP.a](build\Source\libCMSISDSP.a)

注意：路径不要有中文

### Makefile

**使用方法**

先把静态链接库放到根目录

`make run`：生成并运行可执行文件

`make clean`：删除产生的 .o .exe 文件

### DSP++

TODO

