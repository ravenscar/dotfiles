path+=(~/bin)
path+=(~/.sst/bin)
path+=(~/go/bin)

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%(?..%F{red}✘ %f)%F{blue}%~%f %F{green}>%f '
RPROMPT='%F{magenta}${vcs_info_msg_0_}%f'

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^z " fg\n"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# opam configuration
[[ ! -r /Users/pnilsson/.opam/opam-init/init.zsh ]] || source /Users/pnilsson/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun completions
[ -s "/Users/paulnilsson/.bun/_bun" ] && source "/Users/paulnilsson/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
