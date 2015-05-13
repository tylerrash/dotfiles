if [[ $SESSION_TYPE -eq 'remote/ssh' ]]; then
    PROMPT='%F{6}%n%f [%F{6}%m%f] ';
else
    PROMPT='$ ';
fi
