# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Stardog
# export PATH="/usr/local/Cellar/stardog/7.1.2/bin:$PATH"
# export STARDOG_HOME="/Users/anurag/Developer/StardogHome"

# jEnv for managing different versions of Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Workaround for: https://github.com/pyenv/pyenv/issues/688#issuecomment-428675578
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Add mongoDB.app binaries to path
export PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/anurag/.oh-my-zsh"

# Path to brew installed Git instead of Apple-Git
export PATH="/usr/local/git/bin:$PATH"

# Go development 
export GOPATH="${HOME}/.go" 
export GOROOT="$(brew --prefix golang)/libexec" 
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  char          # Prompt character
)
	
# DIR
SPACESHIP_DIR_TRUNC_REPO='false'
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='0' # show only last directory	
SPACESHIP_DIR_COLOR="green"

# GIT
# Disable git symbol
# SPACESHIP_GIT_SYMBOL="\ue0a0 " # disable git prefix
# SPACESHIP_GIT_BRANCH_PREFIX=" " # disable branch prefix too
# Wrap git in `(...)`
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_SUFFIX=""
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
SPACESHIP_GIT_BRANCH_COLOR="magenta"
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=" "
SPACESHIP_GIT_STATUS_COLOR="magenta"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ci="code-insiders"
alias wspdev="cd ~/Developer/2PiRad/wiredscore-platform/web/ && code-insiders . && ng serve"

dist() {
	cd $1;
	npm run build;
	cd ..;
	zip -r ./dist/$1.zip $1 -x "$1/node_modules/*" "$1/ui/*" "$1/.git/*" "$1/instruments.json";
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(pyenv init -)"
export PATH="/usr/local/sbin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Git remove all local feature branches
alias gitClean="git branch | grep -v "master" | xargs git branch -D && git remote prune origin"

#Fortune, Cowsay
fortune | cowsay -f tux
