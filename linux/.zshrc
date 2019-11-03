export PATH=$HOME/bin:/usr/local/bin:~/.dotnet/tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joalcava/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(
  zsh-autosuggestions
  git
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias dnf.up="sudo dnf update"

alias dnet.r="dotnet watch run"
alias dnet.ef.du="dotnet ef database update"
alias dnet.ef.dd="dotnet ef database drop"
alias dnet.ef.mr="dotnet ef migrations remove"
alias dnet.ef.ma="dotnet ef migrations add"

alias mssql="sudo docker start sqlserver"

alias go.i="cd ~/proyectos/isoptimo"

alias g.b="git branch"
alias g.a.="git add ."
alias g.s.="git status ."
alias g.s="git status"
alias g.l="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
