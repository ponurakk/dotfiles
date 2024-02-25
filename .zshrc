# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export BROWSER="waterfox-g"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Other exports
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export PATH="$HOME/.local/bin:/usr/bin/git:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/.surrealdb:$PATH"
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
export EDITOR="$HOME/.local/bin/lvim"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="terminalparty"
# edvardm

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
  zsh-syntax-highlighting
  zsh-kitty
)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
# -- start --
alias ll='ls -lhF'
alias la='ls -AF'
# alias bat='batcat'
alias c='clear -x'
alias fuck='sudo $(fc -ln -1)'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration
# alias hx="$HOME/Applications/helix-22.12-x86_64.AppImage"
# alias intelij="$HOME/Applications/ideaIC-2021.3/idea-IC-213.5744.223/bin/idea.sh"
alias ccl="cargo clean"
alias i3c="cd $HOME/.config/i3 && $EDITOR config"
alias rs="rsync $1"
alias lk="lemmeknow $1"
alias rr="ranger"

## Video
alias vds="ffmpeg -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor $HOME/Videos/Record/$(date +"%Y-%m-%d-%T").ogg -y"
alias vdv="ffmpeg -f x11grab -video_size 3280x1080 -framerate 60 -i :0.0 -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -preset ultrafast -crf 18 -pix_fmt yuv420p $HOME/Videos/Record/$(date +"%Y-%m-%d-%T").mkv -y"
alias vd1="ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i :0.0+1360,0  -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -preset ultrafast -crf 18 -pix_fmt yuv420p $HOME/Videos/Record/$(date +"%Y-%m-%d-%T").mkv -y"
alias vd2="ffmpeg -f x11grab -video_size 1360x768 -framerate 60 -i :0.0 -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -preset ultrafast -crf 18 -pix_fmt yuv420p $HOME/Videos/Record/$(date +"%Y-%m-%d-%T").mkv -y"

## Colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color'
alias ls='exa --icons --color=automatic'
alias ip='ip -color'
alias ping='grc ping'
alias free='grc free -h'
alias netstat='grc netstat'
alias mount='grc mount'
alias lsblk='grc lsblk'

## Other
alias lscmd="compgen $1"
alias rpc="node $HOME/Scripts/Projects/RPC/app.js"
alias talk="espeak -s 130 -p 1 -a 100 -vpl+f6_test $1"
alias clippy="cargo clippy -- -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used -W clippy::expect_used -A clippy::missing_errors_doc -A clippy::doc_markdown"
gv() {
  ({rustc -V && rustup -V && cargo -V && rust-analyzer --version && cargo clippy -V } && {echo "\nzig v$(zig version)"} && { echo "\nnode $(node -v)" && echo "pnpm v$(pnpm -v)" && echo "npm v$(npm -v)" && echo "yarn v$(yarn -v)" && echo "bun v$(bun -v)"} && { echo && javac --version && java --version } && { echo && go version }) 2> /dev/null
}

killp() {
  port=`fuser $1/tcp 2>/dev/null | awk '{print $NF}'`
  if [[ $port != "" ]]; then
    kill -9 $port
  else
    echo "Port not found"
  fi
}

# html(){ cd /var/www; ls --color=always; }
cdls(){ cd $1; ls --color=always; }

# execute in nu
n() {
  nu -c $1
}

# -- end --

# if you like neofetch
# bindkey -s "\t" 'neofetch^M'

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
