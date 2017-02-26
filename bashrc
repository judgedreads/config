# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -CF'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zombiehunt='ps axo stat,ppid,pid,comm | grep -w defunct'
alias open='xdg-open'

function mkcd {
	mkdir -p $1 && cd $1
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function git_state {
    STATE=$(git status 2>/dev/null | grep Your | awk '{ print $4 }')
    BRANCH=$(git status 2>/dev/null | grep "On branch" | awk '{ print $3 }')
    if [ "$STATE" == "ahead" ]; then
        echo "$BRANCH [+$(git status 2>/dev/null | grep Your | awk '{ print $8 }')]"
    elif [ "$STATE" == "behind" ]; then
        echo "$BRANCH [-$(git status 2>/dev/null | grep Your | awk '{ print $7 }')]"
    else
        echo "$BRANCH"
    fi
}

function update_tmux {
	if [[ $TMUX ]]
	then
		#tmux set-window-option status-right "#[fg=yellow][#S]$(git_state)" > /dev/null 2>&1
		printf '\033]2;%s\033\\' "$(git_state)"
		#PS1='\n\[\e[35m\]\t\n\[\e[32m\]\u@\h \$\[\e[m\] '
	fi
}

# prompt
PROMPT_DIRTRIM=2
PS1='\[\e[32;1m\]\w $ \[\e[m\]'
PROMPT_COMMAND='update_tmux'

export EDITOR="vim"
export TERMINAL="st"
export PAGER="less"
source /usr/share/doc/pkgfile/command-not-found.bash
export PATH=$PATH:/usr/local/go/bin:/$HOME/bin:/$HOME/.cargo/bin

# keychain
eval $(keychain --eval --quiet ~/.ssh/id_rsa)

export PYTHONSTARTUP=~/.python2rc
export GOPATH=~
export GO15VENDOREXPERIMENT=1

export FZF_DEFAULT_COMMAND='ag -l'
export FZF_DEFAULT_OPTS='-e'
