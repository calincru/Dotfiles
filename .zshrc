# Local Variables
SCRIPTS_DIR="/home/calin/dev/scripts"

# PATH addings
PATH="/home/calin/qt5/qtbase/bin:$PATH" # qt5 binaries
PATH="/home/calin/qt-creator/build/bin:$PATH" # qt-creator binary

# Prompt
ZSH_THEME="clean"

# Aliases
alias l="ls -F"
alias ll="ls -AGlFt"
alias grep='grep --color=auto'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"

alias sysupdate="sudo $SCRIPTS_DIR/system-update.sh"
alias clearwsp="$SCRIPTS_DIR/clear_whitespaces.sh"
alias setLDLP="source $SCRIPTS_DIR/set_LDLP.sh"

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Shorthands
alias e="exit"
alias py="python"
alias h='history'

# Exports
export Qt5_DIR=/home/calin/qt5/qtbase
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Remove annoying messages
unsetopt correctall

# FASD for faster switching between directories
eval "$(fasd --init auto)"

# LLVM exports
export LLVM_BUILD_DIR=/home/calin/Workplace/llvm_workshop/llvm-build
export LLVM_SOURCE_DIR=/home/calin/Workplace/llvm_workshop/llvm
export LLVM_CFLAGS="$(llvm-config --cxxflags) -fno-rtti"
export LLVM_LDFLAGS="$(llvm-config --ldflags)"

# alt-left and alt-right for switching words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# ZSH Settings
CASE_SENSITIVE="true"

ZSH=$HOME/.oh-my-zsh
plugins=(git common-aliases debian mercurial fasd zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
