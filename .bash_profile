# prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# load nvm
export NVM_DIR="/Users/tyler/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# aliases
alias c='clear'
alias ls='ls -AGhlp'
alias sickbeard='python ~/Sick-Beard/sickbeard.py'
alias proj='cd ~/proj'


echo -e ''
echo -e 'Welcome back, Tyler.'
echo -e $(date)
echo -e ''