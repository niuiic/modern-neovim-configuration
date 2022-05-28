source ~/.local/znap/zsh-snap/znap.zsh

# theme
znap prompt romkatv/powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugins
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source xvoland/Extract
znap source marlonrichert/zsh-autocomplete

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold"

# for zoxide
eval "$(/home/niuiic/.cargo/bin/zoxide init zsh)"

# for sway
export SWAYSOCK=$(ls /run/user/*/sway-ipc* | head -n 1)

# for rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# PATH
export PATH="$PATH:/home/niuiic/.local/bin:/home/niuiic/Applications/Go/bin:$HOME/Applications/Bin:$HOME/Applications/Hex2bin/hex2bin/bin:/home/niuiic/Applications/Stm8/bin:$HOME/Applications/Swift/swift/usr/bin:$HOME/Applications/AndroidStudio/android-studio/bin:/home/niuiic/.cargo/bin:$HOME/Applications/Nodejs/nodejs_global/bin"

# cmd alias
alias pro="proxychains -q"
alias rm="rip"
alias del="/bin/rm"
alias cp="rsync -avz -P"
alias sudo='sudo  '
alias ls="lsd"
alias ps="procs"
alias x="extract"

# for android
export ANDROID_HOME=$HOME/Applications/AndroidStudio/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# show live time
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

# prevent exiting caused by `ctrl + d`
set -o ignoreeof

# for beego
export GOPATH="/home/niuiic/Applications/Go"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
