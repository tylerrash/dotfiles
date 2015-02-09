# prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# aliases
alias c='clear'
alias sickbeard='python ~/Sick-Beard/sickbeard.py'
alias proj='cd ~/proj'
alias tylrr='ssh root@162.243.18.46'
alias dev='./proj/dotfiles/dev'

export CLICOLOR=true
export CLICOLOR_FORCE=true
export FIGNORE="DS_STORE:$FIGNORE"
function ll { ls -AGhlp $@ | grep -v .DS_Store; }

echo -e ''
echo -e 'Welcome back, Tyler.'
echo -e $(date)
echo -e ''

export EDITOR='vim'

export PATH=${PATH}:~/Developer/android-sdk-mac/sdk/platform-tools
export PATH=${PATH}:~/Developer/android-sdk-mac/sdk/tools

export PATH=/usr/local/Cellar/ruby/2.1.4/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
