init_neovim() {
    git clone https://github.com/guerbai/vim-ide-solution ~/.config/nvim

    mkdir -p ~/.local/share/nvim/site/autoload 
    mv ~/ohmyarch/static/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

    sudo pacman -S --noconfirm nodejs npm # for coc.nvim
    sudo pacman -S --noconfirm go
    go get golang.org/x/tools/gopls@latest
    python3 -m pip install --user --upgrade pynvim
}

