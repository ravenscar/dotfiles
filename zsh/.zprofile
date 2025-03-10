if [[ "$OSTYPE" == "darwin"* && -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
fi

autoload -U compinit
compinit

if command -v nvm &>/dev/null || [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

alias vim=nvim
alias vi=nvim

function jump() {
    if [ -z "$1" ]; then
        echo "Usage: jump <subdomain> [command]"
        return 1
    fi

    local subdomain="$1"
    shift

    # The remaining arguments (if any) are taken as the command to run
    if [ -z "$1" ]; then
        ssh -t "paul.nilsson@jumpbox.pnilsson.cd.$subdomain.dn.smokeball.com" "resume"
    else
        ssh -t "paul.nilsson@jumpbox.pnilsson.cd.$subdomain.dn.smokeball.com" "$@"
    fi
}

alias jumpau='ssh paul.nilsson@jumpbox.pnilsson.cd.aus.dn.smokeball.com'
alias jumpus='ssh paul.nilsson@jumpbox.pnilsson.cd.nova.dn.smokeball.com'
alias jumpuk='ssh paul.nilsson@jumpbox.pnilsson.cd.lon.dn.smokeball.com'
alias pdntmp='ssh -i "~/.ssh/pauln-dev-aus.pem" ubuntu@10.132.14.213 -t "tmux attach || tmux new"'
alias bee='ssh bee.local'
alias shipit='ssh -i "~/.ssh/shipit-2024.pem" ubuntu@ec2-3-106-226-162.ap-southeast-2.compute.amazonaws.com'
export DEV_ID=PN3
alias retro='ssh pi@192.168.1.252'
