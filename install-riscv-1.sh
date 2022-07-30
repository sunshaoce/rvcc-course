#!/usr/bin/env bash

# 设置该脚本：出错时终止脚本运行
set -e

# 进入~目录
cd
rm -rf riscv

# 下载编译好的RISCV环境包
wget https://mirror.iscas.ac.cn/plct/rvcc-course-sysroot-20220721.tar.bz2

# 解压
tar xvf rvcc-course-sysroot-20220721.tar.bz2

# 环境设置完成
echo "Complete!"
