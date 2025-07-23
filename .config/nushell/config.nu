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
$env.SSH_AUTH_SOCK = ($env.XDG_RUNTIME_DIR | path join 'ssh-agent.socket')

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

$env.__cmd_start = null
$env.config.hooks = {
  pre_execution : [
    {||
      $env.__cmd_start = (date now)
    }
  ]
}

$env.PROMPT_COMMAND_RIGHT = {||
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    let last_command_duration = if ($env.__cmd_start? != null) {
        $"(ansi reset) (ansi magenta)[(ansi green)⏱ (((date now) - $env.__cmd_start) | format duration sec)(ansi magenta)]"
    } else { "" }

    ([$last_exit_code, (char space), $time_segment, $last_command_duration] | str join)
}
