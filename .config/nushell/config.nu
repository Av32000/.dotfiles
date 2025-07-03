# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.show_banner = false

alias grep = grep --color=auto
alias pacman = sudo pacman
alias pacman-clean = pacman -Qdtq | sudo pacman -Rns -
alias code = codium --enable-features=UseOzonePlatform --ozone-platform=wayland
alias codium = codium --enable-features=UseOzonePlatform --ozone-platform=wayland
alias py = python
alias docker = sudo docker
alias reboot = sudo reboot
alias vim = nvim

$env.config.buffer_editor = "nvim"
load-env {
	"EDITOR": "nvim",
	"LANGUAGE": "en_US.UTF-8",
	"LC_ALL": "en_US.UTF-8",
	"PNPM_HOME": "/home/av32000/.local/share/pnpm",
}

$env.path ++= ["~/.local/bin", "/home/av32000/.spicetify", "/home/av32000/.cargo/bin", "/home/av32000/.local/share/pnpm"]

const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
  ...$NU_PLUGIN_DIRS
]

source ~/.config/nushell/completions/cargo-completions.nu
source ~/.config/nushell/completions/docker-completions.nu
source ~/.config/nushell/completions/gh-completions.nu
source ~/.config/nushell/completions/git-completions.nu
source ~/.config/nushell/completions/make-completions.nu
source ~/.config/nushell/completions/man-completions.nu
source ~/.config/nushell/completions/pnpm-completions.nu
source ~/.config/nushell/completions/ssh-completions.nu
source ~/.config/nushell/completions/tar-completions.nu
source ~/.config/nushell/completions/vscode-completions.nu

source ~/.config/nushell/themes/catppuccin_macchiato.nu
