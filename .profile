alias ll='pwd; ls -lAhv'
alias cp='cp -i'
alias mv='mv -i'
alias cls='printf "\033c"'

export PYTHONSTARTUP=$HOME/.pythonstartup
export PYTHONPYCACHEPREFIX=$HOME/.cache/cpython/

export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

TITLE="\[\e]2;\u - \h - \s\a\]"
export PS1="${TITLE}"'\[\033[38;5;046m\] $ \[\033[0;0m\]'
export PS2=" > "

export CLICOLOR=1
export LS_COLORS="$LS_COLORS:di=00;44"
export TIME_STYLE=$'+%Y%m%d %H:%M:%S'

mkcd () { mkdir -p "$1"; cd "$1"; }

b () {
    for arg in "$@"; do
        if [[ -d "$arg" ]]; then
            (nautilus -w "$@" &)
            return 0
        fi
    done
    (nautilus -w . "$@" &)
}

DEFLIM=20
tt () {
    lim=$DEFLIM
    path="."
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        lim="$1"
    elif [[ -d "$1" ]]; then
        path="$1"
    fi
    if [[ -d "$2" ]]; then
        path="$2"
    fi
    tree -phF --du "$path" --filelimit="$lim"
}

colorgrid() {
    for iter in {16..51}; do
        for col in {0..6}; do
            val=$((($iter+36*$col)%251))
            printf "   \033[38;5;$(echo %d)m\U2588 %03d" $val $val
        done
        printf '\r\n'
    done
}
