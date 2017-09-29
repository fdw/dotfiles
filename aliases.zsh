alias g='git'
alias v='nvim'

function gswitch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) && 
	git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function gf() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  commit=$(git log --oneline origin/master.."$branch" | fzf | awk '{print $1}')

  git commit --fixup="$commit"
}

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
