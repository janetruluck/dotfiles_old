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

# Set vim as the default editor
export EDITOR='vim'

# Set default postgresql version of the system if one is not set
# via environment variable POSTGRESQL_VERSION
if [[ -z "$POSTGRESQL_VERSION" ]]; then
  export POSTGRESQL_VERSION=9.5
fi

# Customize to your needs...
COMMON_PATHS=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
SCALA_HOME=/usr/local/share/scala
RVM_HOME=$HOME/.rvm
POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/latest/bin
PLAY_HOME=$HOME/Projects/binaries/activator/bin
GO_HOME=$HOME/.go
ANDROID_HOME=$HOME/Library/Android/sdk/platform-tools
YARN=`yarn global bin`

PATH=$COMMON_PATHS
PATH=$PATH:$POSTGRES_HOME   # Add Postgres.app to path
PATH=$PATH:$SCALA_HOME/bin  # Add SCALA to PATH
PATH=$PATH:$PLAY_HOME       # Add PLAY! to PATH
PATH=$PATH:$RVM_HOME/bin    # Add RVM to PATH
PATH=$PATH:$RVM_HOME/gems   # Add RVM gems to PATH
PATH=$PATH:$ANDROID_HOME    # Add Android tools to PATH
PATH=$PATH:$YARN            # Add Yarn
export PATH

GOPATH=$GO_HOME             # Add GO to PATH
export GOPATH

# Export kinnects
export OPENNI2_REDIST=/usr/local/lib/ni2
export OPENNI2_INCLUDE=/usr/local/include/ni2

# Tool chain for Odroid
export PATH=/opt/toolchains/gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux/bin:$PATH
export CROSS_COMPILE=arm-linux-gnueabihf-

# Alias for commands
[[ -f ~/.aliases ]] && source ~/.aliases

source $ZSH/oh-my-zsh.sh
