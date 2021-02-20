export PATH=$HOME/bin:/usr/local/bin:~/.dotnet/tools:$PATH
export PATH=$HOME/scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joalcava/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(
  git-auto-fetch
  docker
  docker-compose
  zsh-autosuggestions
  git
  z
)

# GIT_AUTO_FETCH_INTERVAL=1200 # seconds

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias dnf.up="sudo dnf update"

alias clr="clear"

alias aptu="sudo apt update"
alias aptg="sudo apt upgrade"
alias apti="sudo apt install"
alias apts="sudo apt search"
alias aptr="sudo apt remove"
alias aptar="sudo apt autoremove"

alias dnb="dotnet build"
alias dnr="dotnet run"
alias dnw="dotnet watch"
alias dnwr="dotnet watch run"
alias dnres="dotnet restore"
alias dnefdu="dotnet ef database update"
alias dnefdd="dotnet ef database drop"
alias dnefmr="dotnet ef migrations remove"
alias dnefma="dotnet ef migrations add"

alias mssql="sudo docker start sqlserver"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
