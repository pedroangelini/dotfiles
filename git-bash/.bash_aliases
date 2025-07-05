
# ls and eza
export EZA_ICONS_AUTO=1
alias ls='eza --group-directories-first'
alias ll='eza -ahlF --group-directories-first'
alias la='eza -A --group-directories-first'
alias l='eza -CF --group-directories-first'
alias nano='nano --modernbindings'

# vs code
alias code=code-insiders

# see logs with bat
function logview() {
    local tail_lines=`expr $LINES - 5`;
    tail -n $tail_lines -f $1 | bat --paging=never -l log
}

# git
alias gs='git status -s'
