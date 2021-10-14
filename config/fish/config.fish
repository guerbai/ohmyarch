if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
end

function fish_greeting
end

fish_vi_key_bindings

alias .="~"
alias vim="nvim"
alias sa="source activate"
alias sd="source deactivate"
alias ipython3='sa python36 && ipython'

alias doas='/Users/admin/Downloads/doas-for-mac'

alias ga="git add"
alias gc="git commit"
alias gl="git pull"
alias grc="git rebase --continue"
alias gst='git status'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpo="git push --set-upstream origin"
alias glog="git log --oneline --decorate --color --graph"

export GOPATH=$HOME/go
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:$HOME/go/bin:$HOME/.local/bin
export EDITOR=nvim

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

starship init fish | source
