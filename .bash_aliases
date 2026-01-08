# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l1='ls -1'
alias lh='ls -lh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -p'
alias open='xdg-open'
alias reboot='systemctl reboot'
alias off='systemctl poweroff'
alias ip='ip -c'

alias fd='fdfind'
alias cb='xclip -selection "clipboard"'
