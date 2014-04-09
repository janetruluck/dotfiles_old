# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
SCALA_HOME=/usr/local/share/scala
RVM_HOME=$HOME/.rvm
POSTGRES_HOME=/Applications/Postgres.app/Contents/MacOS/bin
PLAY_HOME=$PATH:/usr/local/share/play

PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
PATH=$POSTGRES_HOME:$PATH                         # Add Postgres.app to path
PATH=$PATH:$RVM_HOME/bin                          # Add RVM to PATH
PATH=$PATH:$SCALA_HOME/bin                        # Add SCALA to PATH
PATH=$PATH:$PLAY_HOME                             # Add PLAY! to PATH
PATH="/usr/local/bin:$PATH" >> ~/.bash_profile    # Copy to .bashrc
export PATH

# Alias for commands
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxrld="tmux source-file ~/.tmux.conf"
alias mcsssh="ssh deploy@staging.missioncontrol.io" # SSH to missioncontrol staging

alias rexx="cd $HOME/Projects/bitbucket/filmrexx/" # SSH to missioncontrol staging

