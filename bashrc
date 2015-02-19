# prompt
PS1='\[\e[0;36m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# aliases
alias c='clear'
alias grep='grep --color=auto'
alias proj='cd ~/proj'
alias vim='vim -p '

# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias p='cd ~/projects'

# git aliases
alias ga='git add '
alias gd='git diff '
alias gc='git commit '
alias gb='git branch '
alias gh='git hist '
alias go='git checkout '
alias gp='git push '
alias gpom='git push origin master'
alias gs='git status '

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Better ls
function ll { ls -AGhlp $@ | grep -v .DS_Store; }

export CLICOLOR=true
export CLICOLOR_FORCE=true
export FIGNORE="DS_STORE:$FIGNORE"

export EDITOR='vim'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=/usr/local/Cellar/ruby/2.1.4/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
