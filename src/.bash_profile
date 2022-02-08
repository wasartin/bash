
fucntion listAlias(){
    while read line; do
        if [[ "$line" == *"alias"* ]] && [[ "$line" != *"randomString-129"* ]]; then
            printf "$line\n"
        fi 
    done < ~/.bash_profile
}

alias ls='ls -la'
alias mkdir='mkdir -p'

alias got='git'
alias emasc='emacs'