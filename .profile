if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=remote/ssh
else
    case $(ps -o comm= -p $PPID) in
        ssh|*/sshd) SESSION_TYPE=remote/ssh;;
    esac
fi
