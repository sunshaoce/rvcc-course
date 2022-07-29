# Ubuntu使用下列命令
# sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

# Fedora/CentOS/RHEL使用下列命令
# sudo yum install autoconf automake python3 libmpc-devel mpfr-devel gmp-devel gawk  bison flex texinfo patchutils gcc gcc-c++ zlib-devel expat-devel

# Arch使用下列命令
# sudo pacman -Syyu autoconf automake curl python3 libmpc mpfr gmp gawk base-devel bison flex texinfo gperf libtool patchutils bc zlib expat

# 进入~目录
cd
rm -rf riscv-temp riscv

# 下载riscv-gnu-toolchain源代码
mkdir riscv-temp
cd riscv-temp
wget https://mirror.iscas.ac.cn/plct/riscv-gnu-toolchain.20220725.tar.bz2

# 校验
echo '73448b2c99cda591fdb5b51fd28bf611  riscv-gnu-toolchain.20220725.tar.bz2' | md5sum -c
if [ $? != 0 ]; then 
    echo "Download failed！please download again" 
    exit 1
fi

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
