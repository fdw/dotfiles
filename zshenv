skip_global_compinit=1

LS_OPTIONS="--color=auto -lhF --group-directories-first"
PAGER=/usr/bin/less

export PS1 NLSPATH PAGER MAIL LS_COLORS LS_OPTIONS LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH EDITOR TERM XFILESEARCHPATH

export XDG_CACHE_HOME=${HOME}/.cache/
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.config
export EDITOR=vim
