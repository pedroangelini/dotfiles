# python
alias python=python3
alias py=python3


# ls improved with eza
export EZA_ICONS_AUTO=1
alias ls='eza --group-directories-first'
alias ll='eza -ahlF --group-directories-first'
alias la='eza -A --group-directories-first'
alias l='eza -CF --group-directories-first'

# nano working like it's the 2020's
alias nano='nano --modernbindings'

# bat, a substitute for cat
alias bat=batcat

# git shortcuts
alias gs='git status -s'
alias gc='git commit'
alias gl='git log --oneline --graph'
alias gll='git log git log --pretty --graph'

# random utils

alias wtfis="dpkg -s"
## logs with bat
function logview() {
    local tail_lines=`expr $LINES - 5`;
    tail -n $tail_lines -f $1 | bat --paging=never -l log
}
## important stuff
alias cowfortune="fortune -s | cowsay -f \$(ls -1 /usr/share/cowsay/cows/ | shuf -n 1) -n"


