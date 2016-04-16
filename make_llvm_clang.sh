#!/usr/bin/sh
function print_usage() {
    echo "Firstly donwload llvm, clang and compiler-rt source packages from "\
         "llvm official website into one folder. Then run this script will "\
         "auto extract tars and make it."
}

if [ $# != 1 ]
then
    echo 'Please specify the version.'
    print_usage
    return 1
fi

LLVM_DIR=llvm-src

LLVM_SRC=llvm-$1.src
LLVM_SRC_TAR=$LLVM_SRC.tar.xz

CLANG_SRC=cfe-$1.src
CLANG_SRC_TAR=$CLANG_SRC.tar.xz

COMP_RT_SRC=compiler-rt-$1.src
COMP_RT_SRC_TAR=$COMP_RT_SRC.tar.xz

if [ ! -f $LLVM_SRC_TAR ]; then
    echo "llvm source tar $LLVM_SRC_TAR does not exist!"
    print_usage
    return 1
fi

if [ ! -f $CLANG_SRC_TAR ]; then
    echo "clang source tar $CLANG_SRC_TAR does not exist!"
    print_usage
    return 1
fi

if [ ! -f $COMP_RT_SRC_TAR ]; then
    echo "compiler-rt source tar $COMP_RT_SRC_TAR does not exist!"
    print_usage
    return 1
fi

tar xvf $LLVM_SRC_TAR
mv $LLVM_SRC $LLVM_DIR
cd $LLVM_DIR

tar xvf ../$CLANG_SRC_TAR -C tools
mv tools/$CLANG_SRC tools/clang

tar xvf ../$COMP_RT_SRC_TAR -C projects
mv projects/$COMP_RT_SRC projects/compiler-rt

mkdir build
cd build
cmake -G "Unix Makefiles" ..
make

return 0
