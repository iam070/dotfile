#!/bin/bash
function print_usage() {
    echo "Auto download and make the llvm with clang by specific version."
}

if [ $# != 1 ]
then
    echo 'Please specify the version.'
    exit 1
fi

LLVM_DIR=llvm-src

BASE_LINK="http://llvm.org/releases/$1/"

LLVM_SRC=llvm-$1.src
LLVM_SRC_TAR=$LLVM_SRC.tar.xz
LLVM_SRC_TAR_LINK=$BASE_LINK$LLVM_SRC_TAR

CLANG_SRC=cfe-$1.src
CLANG_SRC_TAR=$CLANG_SRC.tar.xz
CLANG_SRC_TAR_LINK=$BASE_LINK$CLANG_SRC_TAR

COMP_RT_SRC=compiler-rt-$1.src
COMP_RT_SRC_TAR=$COMP_RT_SRC.tar.xz
COMP_RT_SRC_TAR=$BASE_LINK$COMP_RT_SRC_TAR

if [ ! -f $LLVM_SRC_TAR ]; then
    echo "llvm source tar $LLVM_SRC_TAR does not exist!"
    echo "Begin to download $LLVM_SRC_TAR."
    wget $LLVM_SRC_TAR_LINK
    if [ $? != 0 ]
    then
        echo "Failed to download $LLVM_SRC_TAR_LINK!"
        rm -f $LLVM_SRC_TAR
        exit 1
    fi
fi

if [ ! -f $CLANG_SRC_TAR ]; then
    echo "clang source tar $CLANG_SRC_TAR does not exist!"
    echo "Begin to download $CLANG_SRC_TAR."
    wget $CLANG_SRC_TAR_LINK
    if [ $? != 0 ]
    then
        echo "Failed to download $CLANG_SRC_TAR_LINK!"
        rm -f $CLANG_SRC_TAR
        exit 1
    fi
fi

if [ ! -f $COMP_RT_SRC_TAR ]; then
    echo "compiler-rt source tar $COMP_RT_SRC_TAR does not exist!"
    echo "Begin to donload $COMP_RT_SRC_TAR"
    wget $COMP_RT_SRC_TAR_LINK
    if [ $? != 0]
    then
        echo "Failed to download $COMP_RT_SRC_TAR"
        rm -f $COMP_RT_SRC_TAR
        exit 1
    fi
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

exit 0
