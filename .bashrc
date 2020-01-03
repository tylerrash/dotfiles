parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' 
}

# prompt
#PS1='\[\e[0;36m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
    hostnamecolor=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print 30 + (total % 6)}')
    PS1='\[\e[34m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
else
    PS1='\[\e[1;34m\]\w\[\e[m\]\[\e[0;36m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\] →\[\e[m\] \[\e[1;37m\]'
fi

include() {
    [[ -f "$1" ]] && source "$1"
}

# aliases
alias c='clear'
alias grep='grep --color=auto'
alias proj='cd ~/proj'
alias vim='vim -p '
alias steam='wine .wine/drive_c/Program\ Files/Steam/Steam.exe'
alias g='git'
alias dd='deploy-dude -y'
alias python=python3

# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias p='cd ~/projects'
alias ha='history | ack'
alias ga='g ll | ack'

alias serve='python -m SimpleHTTPServer'

alias ports='cat ~/ports'

# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'


# Better ls
function ll { ls -AGhlp $@ | grep -v .DS_Store; }

export CLICOLOR=true
export CLICOLOR_FORCE=true
export FIGNORE="DS_STORE:$FIGNORE"
export EDITOR='vim'
export GREP_OPTIONS='--exclude=*bundle*'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# make fzf respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PATH=/usr/local/Cellar/ruby/2.1.4/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Users/tyler/Library/Python/3.7/bin

# git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# bash completion
_complete_ssh_hosts ()
{
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                    cut -f 1 -d ' ' | \
                    sed -e s/,.*//g | \
                    grep -v ^# | \
                    uniq | \
                    grep -v "\[" ;
                cat ~/.ssh/config | \
                    grep "^Host " | \
                    awk '{print $2}'
                                                            `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur) )
    return 0
}
complete -F _complete_ssh_hosts ssh

# Shell only exits after the 10th consecutive Ctrl-d
IGNOREEOF=10
