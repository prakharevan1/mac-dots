# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'yes' # I forget a lot
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
# z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
# z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
# z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings. that I NEVER USE
# z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
# z4h bindkey redo Option+/            # redo the last undone command line change

# z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
# z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
# z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
# z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
# alias tree='tree -a -I .git'

# Add flags to existing aliases.
# alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# my stuff
# greetings!
clear
source /Users/evand/zsh/greeting.zsh

. "$HOME/.cargo/env"
# mise
eval "$(mise activate zsh)"
# jj completion
source <(COMPLETE=zsh jj)
# vs code
export EDITOR=code
# zoxide
eval "$(zoxide init zsh)"
alias cd=z
# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# homebrew, brew doctor on BOTH ends to check if there is a error before or after updating
alias bup="brew doctor && brew update && brew upgrade && brew cleanup; brew doctor"
# update stuff
function update() {
    mise self-update; bup; rustup update;
    z4h update; # do this LAST! z4h restarts the entire zsh session
}
alias yazi=y
# bat
export BAT_THEME="Catppuccin Mocha"
# eza
alias ls='eza'

# I use trash cli since I sometimes delete things accidently
alias rm='echo "This is not the command you are looking for."; false'

export PATH=$PATH:/Users/evand/.spicetify
export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"

eval "$(/Users/evand/.local/bin/mise activate zsh)" # added by https://mise.run/zsh

# clocktemp
# fixed libressl with macos issue, python3 with mise allows for openssl
alias clocktemp='python3 "/Users/evand/Downloads/programs/ClockTemp/script/clocktemp.py" -tf 12 -df mm/dd -tu f -s true -lat 33.662 -lon -117.800 -c blue -b default'
# cbonsai
alias cbonsai="cbonsai -S -L 40 -t 0.1 -m \"hello, $(whoami) :)\""
alias cbonsainomsg="/usr/local/bin/cbonsai -S -L 40 -t 0.1"
# bat
alias cat=bat
# DOAS I say, not as I do.
alias sudo=doas
# tree
alias tree="eza -T"
# typing test
alias ttest="python -m tttui"
# archstatus
alias archstatus="archstatus -srwf"
# archstatus script
alias archstatus.sh="clear; ~/./archstatus.sh"
