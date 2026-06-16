path+=(~/bin)
path+=(~/.sst/bin)
path+=(~/go/bin)
path+=(/opt/nvim-linux64/bin)
path+=(/usr/local/go/bin)
path+=(/usr/local/node/bin)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
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
PROMPT='%F{yellow}[%m] %(?..%F{red}✘ %f)%F{blue}%~%f %F{green}>%f '
RPROMPT='%F{magenta}${vcs_info_msg_0_}%f'

bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^W' backward-kill-word
bindkey '^?' backward-delete-char

zle-keymap-select() {
  case $KEYMAP in
    vicmd) printf '\e[2 q' ;;
    main|viins) printf '\e[6 q' ;;
  esac
}
zle-line-init() { printf '\e[6 q'; }
zle -N zle-keymap-select
zle -N zle-line-init

export EDITOR=vim
export VISUAL=vim

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
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

alias emacs="emacs -nw"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

. ~/.zprofile
