#!/usr/bin/env sh

set -e

# Source environment and common functions
. ./setup/00-library.sh
. ./setup/environment.sh

# Run modules in order
for script in ./pacman/setup.sh ./git/setup.sh ./weechat/setup.sh; do
    echo "[+] Running $script"
    . "$script"
done

echo "[+] Full setup completed! 🎉"



# install() {
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 	sudo pacman -S firefox chromium zsh curl git weechat stow lazygit
# 	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# 	curl -f https://zed.dev/install.sh | sh
# }

# stow_config() {
#     echo "[+] Stow dos dotfiles"
#     stow -d stow -t "$HOME" zsh
#     stow -d stow/config -t "$HOME" config
# }

# generate_template() {
#     echo "[+] Gerando environment.template"
#     grep -E '^[A-Z_]+=.*' environment | sed 's/=.*/=/' > environment.template
# }

# zsh_environment() {
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# }

# zed_environment() {
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# 	curl -f https://zed.dev/install.sh | sh
# }
