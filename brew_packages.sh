#!/bin/bash
if ! command -v brew &> /dev/null
then
    echo "homebrew not installed, run:"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

brew bundle --file=- <<-EOS
  brew "fzf"
  brew "go"
  brew "htop"
  brew "jq"
  brew "neovim"
  brew "ripgrep"
  brew "stow"
  brew "tmux"
  tap "koekeishiya/formulae"
  brew "koekeishiya/formulae/skhd"
  brew "koekeishiya/formulae/yabai"
  brew "fd"
  brew "sd"
  brew "difftastic"
  brew "just"
  brew "bat"
  brew "tpm"
  brew "fswatch"
  brew "watch"
  brew "lazydocker"
  brew "lazygit"
  brew "awscli"
  cask "font-jetbrains-mono-nerd-font"
  cask "alacritty"
EOS
