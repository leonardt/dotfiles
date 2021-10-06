```bash
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/zshrc ~/.zshrc

mkdir -p $HOME/.config/alacritty
ln -s $PWD/alacritty.yml ~/.config/alacritty/alacritty.yml
```
