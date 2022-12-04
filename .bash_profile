if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
export HISTTIMEFORMAT="%d/%m/%y %T "

# supress catalina new shell warning
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

