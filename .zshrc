export ZSH="/home/flavio/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
    asdf
    git
    yarn
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export DOTNET_ROOT=$(asdf where dotnet-core)
export MSBuildSDKsPath="$(asdf where dotnet-core)/sdk/5.0.102/Sdks"
export NODEJS_CHECK_SIGNATURES=no
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:/home/flavio/.dotnet/tools"

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_USER_SHOW=always

autoload -U compinit && compinit
