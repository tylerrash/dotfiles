if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
export HISTTIMEFORMAT="%d/%m/%y %T "

# supress catalina new shell warning
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

