```bash
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/init.vim
ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/zshrc ~/.zshrc
```
