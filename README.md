# rvcc-course

这里是[RVCC](https://github.com/sunshaoce/rvcc)课程的相关仓库，存放了课程相关的材料。

## Q & A
### 【1】 这个课程都需要准备什么东西？
1. Linux的运行环境，推荐Ubuntu 20.04。
1. RISC-V的实验环境（需要编译器和模拟器），如何安装参考问题【2】。
1. 下载RVCC的仓库，即`git clone https://github.com/sunshaoce/rvcc`。

### 【2】 如何安装RISCV的实验环境
三种方式，自由选择，纯小白推荐方式1.
#### 【暂时不可用】 方式一：解压预先编译好的RISCV环境（基于Ubuntu 20.04）

#### 方式二：源代码编译RISCV环境。
这里我们采用最简单的方式，编译出编译器gcc和模拟器qemu。直接使用本课程的`install-riscv.sh`脚本，使用方法参考：[RISCV环境快速配置](https://www.bilibili.com/video/BV1D54y1m78G)。

#### 方式三：使用配置好的Docker环境
详情可以参考：https://github.com/ksco/rvcc-env-docker。

### 【3】 如何对RVCC中的项目使用`make test`
首先，你需要找到你RISCV实验环境的路径，方式一、二的路径为：`~/riscv`。

其次，你需要将`test.sh`中的下面几行代码，选择为你对应的编译器和模拟器。

最后运行`RISCV=~/riscv make test`，注意这里的`~/riscv`必须你RISCV实验环境的路径。

#### 方式一、二可以参考下面这个改法：
修改前：
```shell
  # 运行程序，传入期待值，将生成结果写入tmp.s汇编文件。
  # 如果运行不成功，则会执行exit退出。成功时会短路exit操作
  ./rvcc "$input" > tmp.s || exit
  # 编译rvcc产生的汇编文件
  clang -o tmp tmp.s
  # $RISCV/bin/riscv64-unknown-linux-gnu-gcc -static -o tmp tmp.s

  # 运行生成出来目标文件
  ./tmp
  # $RISCV/bin/qemu-riscv64 -L $RISCV/sysroot ./tmp
  # $RISCV/bin/spike --isa=rv64gc $RISCV/riscv64-unknown-linux-gnu/bin/pk ./tmp
```
修改后：
```shell
  # 运行程序，传入期待值，将生成结果写入tmp.s汇编文件。
  # 如果运行不成功，则会执行exit退出。成功时会短路exit操作
  ./rvcc "$input" > tmp.s || exit
  # 编译rvcc产生的汇编文件
  # clang -o tmp tmp.s
  $RISCV/bin/riscv64-unknown-linux-gnu-gcc -static -o tmp tmp.s

  # 运行生成出来目标文件
  # ./tmp
  $RISCV/bin/qemu-riscv64 -L $RISCV/sysroot ./tmp
  # $RISCV/bin/spike --isa=rv64gc $RISCV/riscv64-unknown-linux-gnu/bin/pk ./tmp
```

## 跳转脚本
感谢 @daquexian。

用法是把它复制到 rvcc 项目目录之后：
```shell
./jump.sh n 跳转到下一节课程 commit
./jump.sh p 跳转到上一节课程的 commit
./jump.sh <number> 跳转到第 number 节课程的 commit
```
不想污染 rvcc 目录的话也可以不复制，只要在 rvcc 目录下用正确的脚本路径运行就行。
