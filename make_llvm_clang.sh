#!/bin/bash

if [ $# != 2 ]
then
    echo 'Usage: $0 <llvm-version> <ycm_cpp_path>'
    echo 'Example: $0 3.9.1 "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp"'
    exit 1
fi

CUR_PWD=$(pwd)

LLVM_DIR=$CUR_PWD/llvm-src

BASE_LINK="http://llvm.org/releases/$1/"

LLVM_SRC=llvm-$1.src
LLVM_SRC_TAR=$LLVM_SRC.tar.xz
LLVM_SRC_TAR_LINK=$BASE_LINK$LLVM_SRC_TAR

CLANG_SRC=cfe-$1.src
CLANG_SRC_TAR=$CLANG_SRC.tar.xz
CLANG_SRC_TAR_LINK=$BASE_LINK$CLANG_SRC_TAR

COMP_RT_SRC=compiler-rt-$1.src
COMP_RT_SRC_TAR=$COMP_RT_SRC.tar.xz
COMP_RT_SRC_TAR_LINK=$BASE_LINK$COMP_RT_SRC_TAR

echo "LLVM_SRC_TAR LINK: $LLVM_SRC_TAR_LINK"
echo "LLVM_SRC_TAR LINK: $LLVM_SRC_TAR_LINK"
echo "CLANG_SRC_TAR_LINK: $CLANG_SRC_TAR_LINK"
echo "COMP_RT_SRC_TAR_LINK: $COMP_RT_SRC_TAR_LINK"

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
    echo "Begin to download $COMP_RT_SRC_TAR"
    wget $COMP_RT_SRC_TAR_LINK
    if [ $? != 0]
    then
        echo "Failed to download $COMP_RT_SRC_TAR"
        rm -f $COMP_RT_SRC_TAR
        exit 1
    fi
fi

if [ ! -f $LLVM_DIR ]; then
    tar xvf $LLVM_SRC_TAR
    mv $LLVM_SRC $LLVM_DIR
    cd $LLVM_DIR

    tar xvf ../$CLANG_SRC_TAR -C tools
    mv tools/$CLANG_SRC tools/clang

    tar xvf ../$COMP_RT_SRC_TAR -C projects
    mv projects/$COMP_RT_SRC projects/compiler-rt
    mkdir build
fi

cd $LLVM_DIR/build

# cmake -G "Unix Makefiles" ..
# cmake -G "Unix Makefiles" .. -DCMAKE_BUILD_TYPE:"Release" -DLLVM_Targets_to_build:"X86_64"
cmake -G "Unix Makefiles" .. -DCMAKE_BUILD_TYPE:string=Release -DLLVM_TARGETS_TO_BUILD:string="x86_64"

if [ $? != 0 ]; then
    echo "Failed to cmake Makefiles for llvm and clang."
    exit 1
fi
make
if [ $? != 0 ]; then
    echo "Failed to make."
    exit 1
fi

mkdir -p ycm_build
cd ycm_build

cmake -G "Unix Makefiles" . -DEXTERNAL_LIBCLANG_PATH=../lib/libclang.so $2 
if [ $? != 0]; then
    echo "Failed to cmake Makefiles!"
fi

cmake --build . --target ycm_core --config Release
if [ $? != 0 ]; then
    echo "Failed to cmake build ycm_core!"
fi

exit 0
