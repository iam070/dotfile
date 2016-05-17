if [ $# != 1 ]
then
    echo 'Please input the $VIMRC dir'
    exit 1
fi

VIMFILES=$1/vimfiles/
mkdir -p $VIMFILES/bundle

git clone https://github.com/VundleVim/Vundle.vim.git $VIMFILES/bundle/Vundle.vim
cp .vimrc $1/_vimrc
