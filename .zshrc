# Path to your oh-my-zsh installation.
export ZSH=/home/calin/.oh-my-zsh

# This is needed in order for tmux to work.
export TERM=xterm-256color

# Set up dir colors.
eval `dircolors ~/.dir_colors_dark`

# Set name of the theme to load.
ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=10

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting fasd archlinux cabal gitfast
         common-aliases zsh-autosuggestions extract tmux zsh_reload
        )

# Preferred editor for local and remote sessions
EDITOR=vim

# Preferred browser
BROWSER=firefox

# Tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
alias tmux='tmux -2'

# FASD for faster switching between directories
eval "$(fasd --init auto)"

# Aliases
alias vi='vim'
alias rm='rm -vi'
alias grep='grep --color=auto'
alias netest="ping 8.8.8.8"
alias weather="curl -4 http://wttr.in/Zurich"
alias se='extract'

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Remove annoying messages
unsetopt correctall

# Personal additions to PATH to be seen by awesome
export PATH="/home/calin/scripts:$PATH"
export PATH="/home/calin/scripts/eth:$PATH"

# No need for XON/XOFF
stty -ixon
stty stop undef

# added by Miniconda3 4.3.21 installer
export PATH="/home/calin/miniconda3/bin:$PATH"

function view {
  [ "$#" -eq 1 ]
  if file "$1" | grep -q "PDF"; then
    evince "$1"
  elif file "$1" | grep "GIF"; then
    gifview "$1"
  elif file "$1" | grep "image"; then
    xloadimage -quiet "$1"
  elif file "$1" | grep "MP4"; then
    vlc "$1"
  fi
}

# MATLAB
alias matlab='matlab -nodesktop'

# Don't open less if less than a page.
export LESS="-F -R -X $LESS"

# Import pass configuration.
source ~/.pass.zsh

# NOTE: Keep this at the end.
source $ZSH/oh-my-zsh.sh
