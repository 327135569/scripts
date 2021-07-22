alias df="df -h"
alias ls="ls -lah"
alias gw="cd ~/mywork"
alias gh="cd ~/"

source ~/proxy.sh

export CROSS_COMPILE="$HOME/mywork/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-"

alias envk="export PATH=~/bin:$HOME/mywork/aarch64-linux-android-4.9/bin:$PATH"
alias configk="make ARCH=arm64 O=out msmcortex-perf_defconfig"
alias buildkk="bear -- make ARCH=arm64 O=out -j4"
alias buildk="make ARCH=arm64 O=out -j4"
