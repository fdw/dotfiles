# Prompt
export TERM="xterm-256color"

# Storage
## Cache dir
ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
mkdir -p ${ZSH_CACHE_DIR}
## Data dir
ZSH_DATA_DIR="${XDG_DATA_HOME}/zsh"
mkdir -p ${ZSH_DATA_DIR}

# History
command_oriented_history=1
HISTCONTROL=ignoreboth
ulimit -c unlimited
umask 022
mesg y
export HISTFILE="${ZSH_DATA_DIR}/history"
export HISTSIZE=1000
export SAVEHIST=1000
fc -R ${HISTFILE}

# Completion
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
## Caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${ZSH_CACHE_DIR}/autocomplete
## Forcing the rehash
_force_rehash() {
	(( CURRENT == 1 )) && rehash
	return 1
}

# Aliases
alias -g ...='../..'
alias ls='ls ${=LS_OPTIONS}'
alias -g ll='ls'
alias la='ls -A'
alias -g mkdir='mkdir -p'
alias -g grep='grep --color'
alias g='git'
alias v='nvim'

function r() {
	if [ "$1" != "" ]; then
		if [ -d "$1" ]; then
			ranger "$1"
		else
			ranger "$(autojump $1)"
		fi
	else
		ranger
	fi
}

# zsh options
## changing directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
## completion
setopt auto_list
setopt auto_menu
setopt auto_remove_slash
setopt complete_in_word
setopt list_rows_first
setopt list_types
## Globbing
setopt extended_glob
setopt no_case_glob
setopt numeric_glob_sort
setopt glob
## History
setopt append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history
## I/O
setopt correct
setopt print_exit_value
## Job Control
setopt autoresume
setopt nohup
setopt no_notify
## Prompting
setopt prompt_subst
## Scripts
setopt multios

# Key bindings
bindkey '^D' list-choices
bindkey '^i' expand-or-complete-prefix

# Plugins
## Colorful ls
if [[ -f "${HOME}/.dir_colors" ]]
then
	eval `dircolors ${HOME}/.dir_colors`
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
## Autojump
if [[ -f /usr/share/autojump/autojump.zsh ]]
then
	. /usr/share/autojump/autojump.sh
fi
## Zplug
ZPLUG_HOME=${ZSH_DATA_DIR}/zplug
source ${ZPLUG_HOME}/init.zsh

# Prompt
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator load time)
DEFAULT_USER=fdw
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_VERBOSE=false

# Plugins
### ZPlug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
### Theme
zplug "bhilburn/powerlevel9k", as:theme
### Syntax Highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2
### Color man pages
zplug "plugins/colored-man-pages", from:oh-my-zsh
### fzf
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug load
## Config for plugins
### fzf
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --follow --ignore-case"
export FZF_DEFAULT_OPTS="--height=40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
