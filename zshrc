fpath=( "$HOME/dotfiles/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit; compinit


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export FZF_DEFAULT_COMMAND='rg --files'
# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

alias vim=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
<<<<<<< HEAD
__conda_setup="$('/Users/leonardtruong/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/leonardtruong/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/leonardtruong/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/leonardtruong/miniconda3/bin:$PATH"
=======
__conda_setup="$('/home/lenny/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lenny/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lenny/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lenny/miniconda3/bin:$PATH"
>>>>>>> d07380f (update)
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto'

export EDITOR=nvim

export GENESIS_HOME=$HOME/repos/Genesis2/Genesis2Tools
export PATH=$PATH:$GENESIS_HOME/bin:$GENESIS_HOME/gui/bin
export PERL5LIB=$GENESIS_HOME/PerlLibs/ExtrasForOldPerlDistributions

export PATH=$PATH:$HOME/.local/bin
# export PATH="$(yarn global bin):$PATH"

alias ls=exa
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# export PATH="$HOME/miniconda3/bin:$PATH"
export PATH=$HOME/.config/rofi/bin:$PATH
export PATH=$HOME/repos/circt/build/bin:$PATH
