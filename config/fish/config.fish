# eval (goenv init - | source)

# set the workspace path
set -x GOPATH /home/nusk/go
set -x PATH $GOENV_ROOT/bin $PATH

# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# aliases
alias update-grub "grub-mkconfig -o /boot/grub/grub.cfg"
alias ec "nvim ~/.config/fish/config.fish"
alias sc "source /home/nusk/.config/fish/config.fish"
alias eh "nvim ~/.config/home-manager/home.nix"
alias hs "home-manager switch"
alias ip="ip -c"
alias nv=nvim

set -x $BROWSER vivaldi

# greeting
function fish_greeting
    printf "Hello Friend!\n\nToday is $(date "+%A %B %d")" | cowthink -f (find /nix/store/pgi56kg7qkbak3vkjm54012adx42kynz-cowsay-3.8.3/share/cowsay/cows/ -type f | shuf -n 1)
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nusk/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/home/nusk/Downloads/google-cloud-sdk/path.fish.inc'
end
