# rvcc-course

这里是[RVCC](https://github.com/sunshaoce/rvcc)课程的相关仓库，存放了课程相关的材料。

## RISC-V环境构建
使用`install-riscv.sh`即可，相关使用视频请访问[RISCV环境快速配置](https://www.bilibili.com/video/BV1D54y1m78G)。

## 跳转脚本
感谢 @daquexian。

用法是把它复制到 rvcc 项目目录之后：
```shell
./jump.sh n 跳转到下一节课程 commit
./jump.sh p 跳转到上一节课程的 commit
./jump.sh <number> 跳转到第 number 节课程的 commit
```
不想污染 rvcc 目录的话也可以不复制，只要在 rvcc 目录下用正确的脚本路径运行就行。
