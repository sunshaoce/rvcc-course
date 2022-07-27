# 进入~目录
cd
rm -rf riscv-temp riscv

# 下载riscv-gnu-toolchain源代码
mkdir riscv-temp
cd riscv-temp
wget https://mirror.iscas.ac.cn/plct/riscv-gnu-toolchain.20220725.tar.bz2

# 解压
tar xvf riscv-gnu-toolchain.20220725.tar.bz2

# 新建编译目录
cd riscv-gnu-toolchain
mkdir build
cd build

# 生成配置文件
../configure --prefix=$HOME/riscv

# 进行编译
make build-sim linux -j$(nproc)
cd

# 删除临时文件
rm -rf riscv-temp
echo "Compilation Complete!"
