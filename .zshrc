# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler rails web-search)

# Customize to your needs...
COMMON_PATHS=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
SCALA_HOME=/usr/local/share/scala
RVM_HOME=$HOME/.rvm
POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/9.3/bin
PLAY_HOME=/usr/local/share/play
GO_HOME=$HOME/.go
TMUXIFIER=$HOME/.tmuxifier

PATH=$COMMON_PATHS
PATH=$PATH:$POSTGRES_HOME   # Add Postgres.app to path
PATH=$PATH:$SCALA_HOME/bin  # Add SCALA to PATH
PATH=$PATH:$PLAY_HOME       # Add PLAY! to PATH
PATH=$PATH:$RVM_HOME/bin    # Add RVM to PATH
PATH=$PATH:$RVM_HOME/gems   # Add RVM gems to PATH
PATH=$PATH:$TMUXIFIER       # Add Tmuxifier https://github.com/jimeh/tmuxifier
export PATH

GOPATH=$GO_HOME             # Add GO to PATH
export GOPATH

# Alias for commands
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxrld="tmux source-file ~/.tmux.conf"

source $ZSH/oh-my-zsh.sh
