

# __PS1_BEFORE=''
# __PS1_USER='\[\e[97;104m\] \u'
# __PS1_LOCATION='\[\e[30;43m\] \w '
# __PS1_GIT_BRANCH='\[\e[97;45m\] `__git_ps1` '
# __PS1_AFTER='\[\e[0m\]\n'

# export PS1="${__PS1_BEFORE}${__PS1_USER}${__PS1_LOCATION}${__PS1_GIT_BRANCH}${__PS1_AFTER}"


# HELPER FUNCTIONS
################################
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}



# OpenSSH agent config
###############################
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env


# AUTOCOMPLETION
######################
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous on"
# Autocomplete with the first valid completion, not only the common characters
bind "set menu-complete-display-prefix off"
# Ignore case for completion
bind "set completion-ignore-case on"


# Other random options
##########################
shopt -s autocd # no need to type cd

# append history and reload automatically after each
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
shopt -s histappend
PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"


# ALIASES and color
################################


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
#alias ll='ls -ahlF'
#alias la='ls -A'
#alias l='ls -CF'

TERM=cygwin

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source ~/.bash_aliases


# Starship Prompt
# bin file is in /c/Users/pedro/.starship_prompt
addToPATH /c/Users/pedro/.starship_prompt
eval "$(starship init bash)"


# bat installation
addToPATH /c/Users/pedro/AppData/Local/bat

# office folder
addToPATH /c/Program\ Files/Microsoft\ Office/root/Office16/

source ~/.config/fzfconfigs.sh

# zoxide
eval "$(zoxide init bash)"
