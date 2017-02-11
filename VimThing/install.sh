mkdir ~/.vim
cp -r vimrcs/ ~/.vim/vimrcs

echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/vimrc.bundles
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/extended.vim
source ~/.vim/vimrcs/vimrc.fyb

' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
