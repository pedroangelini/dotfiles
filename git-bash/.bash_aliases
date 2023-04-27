alias code=code-insiders
function logview() {
    local tail_lines=`expr $LINES - 5`;
    tail -n $tail_lines -f $1 | bat --paging=never -l log
}
