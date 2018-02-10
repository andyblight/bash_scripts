# Some useful aliases.
alias h='history'
alias j="jobs -l"
alias pu="pushd"
alias po="popd"
alias psg="ps aux | grep"

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

PATH=$HOME/bin:$PATH

# Colour prompt 
# User specific aliases and functions
source /usr/lib/git-core/git-sh-prompt

# For 256 colours in xterm
if [ "$TERM" == "xterm" ] || [ "$TERM" == "screen" ] || [ $TERM == "xterm-256color" ]; then
    #TERM=xterm-256color
    export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

    # Bash prompt
    # Colours:
    txtpur='\e[0;35m' # Purple

    # using tput commands
    FGBLK=$( tput setaf 0 ) # 000000
    FGRED=$( tput setaf 1 ) # ff0000
    FGGRN=$( tput setaf 2 ) # 00ff00
    FGYLO=$( tput setaf 3 ) # ffff00
    FGBLU=$( tput setaf 4 ) # 0000ff
    FGMAG=$( tput setaf 5 ) # ff00ff
    FGCYN=$( tput setaf 6 ) # 00ffff
    FGWHT=$( tput setaf 7 ) # ffffff

    BGBLK=$( tput setab 0 ) # 000000
    BGRED=$( tput setab 1 ) # ff0000
    BGGRN=$( tput setab 2 ) # 00ff00
    BGYLO=$( tput setab 3 ) # ffff00
    BGBLU=$( tput setab 4 ) # 0000ff
    BGMAG=$( tput setab 5 ) # ff00ff
    BGCYN=$( tput setab 6 ) # 00ffff
    BGWHT=$( tput setab 7 ) # ffffff

    RESET=$( tput sgr0 )
    BOLDM=$( tput bold )
    UNDER=$( tput smul )
    REVRS=$( tput rev )

    export PS1="\[$BOLDM\]\[$FGGRN\]\u@\h\[$txtpur\]\[$BOLDM\] \w\[$FGRED\]\$(__git_ps1 \(%s\))\[$FGGRN\]\$ \[$RESET\]"
else
    export PS1="\u@\h \w\$(__git_ps1 \(%s\))\$ "
fi

HISTCONTROL=ignoredups
