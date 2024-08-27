if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Set Vars
set -gx BUN_INSTALL "$HOME/.bun"
set -gx ANDROID_HOME /opt/android-sdk
set -gx EDITOR nvim
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -gx BROWSER firefox-developer-edition
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx NDK_HOME "$ANDROID_HOME/ndk/26.1.10909125"

# Set path
set -gx PATH "$HOME/.local/bin:$PATH"
set -gx PATH "$HOME/.cargo/bin:$PATH"
set -gx PATH "$BUN_INSTALL/bin:$PATH"
set -gx PATH "$HOME/go/bin:$PATH"
# kurwa
set -gx PATH "$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

set -gx PATH "$PATH:$ANDROID_HOME/tools"
set -gx PATH "$PATH:$ANDROID_HOME/tools/bin"
set -gx PATH "$PATH:$ANDROID_HOME/platform-tools"
set -gx PATH "/opt/flutter/bin:$PATH"
set -gx PATH "$PATH:$PNPM_HOME"
set -gx PATH "$PATH:$HOME/Applications/bin"

# Init starship
starship init fish | source

# Remove greeting
set -g fish_greeting

# Aliases
alias ll='ls -lh'
alias la='ls -A'
# alias bat='batcat'
alias cat='bat -p'
alias c='clear -x'
alias fuck='sudo $(fc -ln -1)'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.config/fish/config.fish" # reload fish configuration
# alias hx="$HOME/Applications/helix-22.12-x86_64.AppImage"
# alias intelij="$HOME/Applications/ideaIC-2021.3/idea-IC-213.5744.223/bin/idea.sh"
alias ccl="cargo clean"
alias i3c="cd $HOME/.config/i3 && $EDITOR config"
alias rs="rsync $1"
alias lk="lemmeknow $1"
alias rr="ranger"
alias ff='fastfetch'

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
alias df='grc df'
alias du='grc du'

## Other
# alias lscmd="compgen $1"
# alias rpc="node $HOME/Scripts/Projects/RPC/app.js"
alias talk="espeak -s 130 -p 1 -a 100 -vpl+f6_test $1"
alias clippy="cargo clippy -- -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used -W clippy::expect_used -A clippy::missing_errors_doc -A clippy::doc_markdown"

# function gv 
#   ({rustc -V && rustup -V && cargo -V && rust-analyzer --version && cargo clippy -V } && {echo "\nzig v$(zig version)"} && { echo "\nnode $(node -v)" && echo "pnpm v$(pnpm -v)" && echo "npm v$(npm -v)" && echo "yarn v$(yarn -v)" && echo "bun v$(bun -v)"} && { echo && javac --version && java --version } && { echo && go version }) 2> /dev/null
# end

function killp
  port=`fuser $1/tcp 2>/dev/null | awk '{print $NF}'`
  if [[ $port != "" ]]
    then
    kill -9 $port
  else
    echo "Port not found"
  end
end

# html(){ cd /var/www; ls --color=always; }
function cdls
  cd $1
  ls --color=always
end

# execute in nu
function n
  nu -c $1
end
