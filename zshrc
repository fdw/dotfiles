# Cache dir
ZSH_CACHE="${XDG_CACHE_HOME}/zsh"
mkdir -p ${ZSH_CACHE}
# Data dir
ZSH_DATA="${XDG_DATA_HOME}/zsh"
mkdir -p ${ZSH_DATA}
# History
command_oriented_history=1
HISTCONTROL=ignoreboth
ulimit -c unlimited
umask 022
mesg y
export HISTFILE="${ZSH_DATA}/history"
export HISTSIZE=8192
export SAVEHIST=8192
fc -R ${HISTFILE}

# Directory stack
DIRSTACKSIZE=15
DIRSTACKFILE="${ZSH_DATA}/dirstack"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
		[[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
	fi
	chpwd() {
		print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
	}

# Completion
autoload -U compinit
compinit -d "${ZSH_CACHE}/zcompdump"
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
## Caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${ZSH_CACHE}/autocomplete
## Forcing the rehash
_force_rehash() {
	(( CURRENT == 1 )) && rehash
	return 1
}

# Aliases
alias -g ...='../..'
alias -g ....='../../..'
alias ls='ls ${=LS_OPTIONS}'
alias lsa='ls -A'
alias mkdir='mkdir -p -v'
alias recentchanges='find . -mtime -7 | sort | less'

# zsh options
## changing directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignoredups
setopt pushd_silent
setopt pushd_to_home
## completion
setopt auto_list
setopt auto_menu
setopt auto_remove_slash
setopt complete_aliases
setopt complete_in_word
setopt list_rows_first
setopt list_types
## Globbing
setopt extended_glob
setopt glob
## History
setopt append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
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
bindkey '^P' history-incremental-search-backward
bindkey '^N' history-incremental-search-forward
bindkey '^D' list-choices
bindkey '^R' history-incremental-search-backward
bindkey '^i' expand-or-complete-prefix

# Prompt
## Colors
FG=white
BG=black
## Git options
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%{%F{green}%}•'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}•'
zstyle ':vcs_info:git:*' branchformat '%b'
zstyle ':vcs_info:*' formats ' [%b]%u%c%m'
zstyle ':vcs_info:*' actionformats ' [%b(%a)]%u%c%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash
precmd () {
	vcs_info
}
## Show remote ref name and number of commits ahead or behind - taken from http://eseth.org/2010/git-in-zsh.html
function +vi-git-st() {
	local ahead behind remote
	local -a gitstatus

	# Are we on a remote-tracking branch?
	remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

	if [[ -n ${remote} ]] ; then
		ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
		(( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )

		behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
		(( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )

		hook_com[branch]="${hook_com[branch]}→${remote}${(j:/:)gitstatus}"
	fi
}
## Show count of stashed changes - taken from http://eseth.org/2010/git-in-zsh.html
function +vi-git-stash() {
	local -a stashes

	if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
		stashes=$(git stash list 2>/dev/null | wc -l)
		hook_com[misc]+="%{%F{yellow}%}•"
	fi
}
## Real prompt config
PROMPT='%{%k%f%}
%{%K{${BG}}%F{${FG}}%}%n@%m : %~${vcs_info_msg_0_}%E
%(?..%F{red}%?%F{${FG}})%{%K{${BG}%F{${FG}}%}%# %{%f%k%b%} '

# Plugins
# Colorful ls
if [[ -f "${HOME}/.dir_colors" ]]
then
	eval `dircolors ${HOME}/.dir_colors`
fi
## Autojump
if [[ -f /usr/share/autojump/autojump.zsh ]]
then 
	. /usr/share/autojump/autojump.sh
fi
## Syntax Highlighting
if [[ -f "${ZSH_DATA}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]
then
	source ${ZSH_DATA}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
## Syntax Highlighting
if [[ -f "${ZSH_DATA}/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]
then
	source ${ZSH_DATA}/zsh-history-substring-search/zsh-history-substring-search.zsh
	zmodload zsh/terminfo
	bindkey "$terminfo[kcuu1]" history-substring-search-up
	bindkey "$terminfo[kcud1]" history-substring-search-down
fi
