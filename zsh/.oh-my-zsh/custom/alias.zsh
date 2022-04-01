# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
##Firefox
alias firefox='/usr/lib/firefox/firefox-bin'

##Search PS
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# check dunst
alias dun='killall dunst && dunst &                                           
notify-send "cool1" "yeah it is working"
notify-send "cool2" "yeah it is working"'

#docker
alias dsr='docker container stop $(docker container ls -aq); docker container rm $(docker container ls -aq)'
alias dri='docker rmi $(docker images -aq)'

#sec
alias logz='sudo find /var/log/ -type f \( -name "*.log" \) -exec tail -f "$file" {} +'
alias sys-scan='sudo clamscan -r / --log=/tmp/clamav_report.log'
alias audit='cd ~/.scripts/xfrom_source/lynis-master/; sudo ./lynis audit system'
alias ssys="sudo systemctl $1 $2"

#pass
alias inf='gpg -d ~/Documents/i'

#Packages
alias pkgs='yay -Qqe > ~/.config/pkglist.txt'
alias clean-pkgs='sudo pacman -R $(pacman -Qdtq)'
alias yays="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

#wget website images
alias wget-i='wget -nd --page-requisites --span-host -A'

#Git
alias gi='git init'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gpsh='git push -u origin master'
alias gpll='git pull'
alias dotg='cd ~/dotfiles/; git status'
alias gcl='git clone'

#stow
alias tlinks='stow --adopt -nv'
alias clinks='stow --adopt -v'

#ProtonVPN
alias prof='sudo protonvpn c -f'
alias pros='sudo protonvpn c --sc'
alias prot='sudo protonvpn c --tor -p tcp'
alias pror='protonvpn refresh'
alias prod='sudo protonvpn d'

#Polybar
alias poly='~/.config/polybar/launch.sh'

#GPU
alias gpu='watch -d -n 0.5 nvidia-smi'

#tty-clock
alias tm='tty-clock -c -x -t'

#feh image
alias feh='feh --scale-down --auto-zoom'
alias feh-ss='feh -Z -. -D 5'

#Feh background (2 monitors)
alias wp='feh --bg-fill ~/.config/wall.png --bg-fill ~/.config/wall2.png'
alias wpc='feh --bg-fill ~/.config/wall.png --bg-fill ~/.config/wall2.png; wal -n -i ~/.config/wall.png -a 90'
alias tt='wal -n -i ~/.config/wall.png -a'

#Colors
alias col='cb-small; colorpanes; colorline && hex && hex-block && colortest && colorblocks && colorbars'

#refresh bash
alias rb='source ~/.bashrc'
alias rz='source ~/.zshrc'

#fix terminal
alias fixur='xrdb ~/.Xresources'

#Openbox Window Identifier
alias win='obxprop | grep "^_OB_APP"'

#Ranger
alias fm='ranger'

#Font Cache Refresh
alias rf='fc-cache -f -v'
alias fl='fc-list | grep "~/.fonts/"'

#Youtube-DL
alias yd='cd /mnt/TB_2/Media/yd; youtube-dl --restrict-filenames'
alias ydm='youtube-dl --restrict-filenames --extract-audio --embed-thumbnail --audio-format mp3'

#vim
alias vim-s='vim -S ~/.vim/sessions/main.vim'

#Figlet
alias yo='figlet -f ~/.fonts/misc/figlet/3D-ASCII.flf'
alias yo2='figlet -f ~/.fonts/misc/figlet/isometric.flf'
alias figlet_font='figlet -f $(ls -d ~/.fonts/misc/figlet/* | shuf -n 1)'

#Shred
alias shreddit='shred -n 5 -v -z'

#XRDM
alias cs='xrdm color'
alias tf='xrdm font'

#duck
alias evc='cd ~/Downloads/EvilOSX; python start.py --cli --port 1337'
alias evb='cd ~/Downloads/EvilOSX; python start.py --builder'
alias duck='mv ~/Downloads/EvilOSX/data/builds/*Launcher* ~/Downloads/EvilOSX/data/builds/e.txt; cd ~/Downloads/USB-Rubber-Ducky/;java -jar duckencoder.jar -i ~/Downloads/EvilOSX/data/builds/e.txt; cp ~/Downloads/USB-Rubber-Ducky/inject.bin ~/Downloads/'

#usb
alias musb='sudo mount -U AEA4-ED67 /mnt/usb'
alias umusb='sudo umount /mnt/usb'

#update firefox
alias uff='pkill firefox-bin; sudo mv /usr/lib/firefox /usr/lib/firefox_old; sudo cp -r ~/Downloads/firefox /usr/lib/'
alias dff='sudo rm -rf /usr/lib/firefox_old'

#YTFZF
alias yt='ytfzf -tT'

#Reddit
alias reddit='rtv'

#RVMatting
alias rvm='python inference.py --variant resnet50 --checkpoint checkpoint/rvm_resnet50.pth --device cuda --input-source input/input.mp4 --output-type video --output-composition output/com.mp4 --output-alpha output/alp.mp4 --output-foreground output/for.mp4 --output-video-mbps 10 --seq-chunk 1'

#Disk Utility
alias disk-util='ncdu'

#gotop
alias gotop-f='gotop --nvidia --averagecpu --statusbar --mbps --layout kitchensink'

#pwgen
alias pwgen='pwgen -syn'

#who
alias whor='curlie post https://whoer.net/ | rg -A 10 -e 'ip_plain' -e 'anonymizer :' -e 'tor :' -e 'webrtc:' -e 'dsbl :' -e 'vpn_provider' -e 'proxy :' -e 'proxy_ports :' -e 'track :' -e 'langs :' -e 'ua_mismatch :' -e 'datacenter_ip: ' | head -n300 | tail -n46'

#ff
alias ff='/usr/lib/firefox/firefox-bin'

#k-reset
alias k-reset='sudo kubeadm reset; sudo rm -rf /etc/cni/net.d; rm ~/.kube/config; sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X; prof; sudo systemctl restart kubelet; sudo iptables --list; sudo systemctl status kubelet'

#ip
alias ip-flush='sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X'
alias ip-list='sudo iptables --list'
alias vip='ifconfig | rg -A 5 proton0 | rg "inet " | sd "netmask.*" "" | sd "inet" "" | sd " " ""'

#figlet
alias fig='font="$(ls -d ~/.fonts/misc/figlet/* | shuf | tail -n1)"; figlet -f $(echo "$font")'

#neo
alias nfa='neofetch --ascii "$(figlet -f ~/.fonts/misc/figlet/isometric.flf T)"'

#python
alias py='source ~/.venv/bin/activate'
alias cona='conda activate'
alias cond='conda deactivate'

#RDL
alias rdl='cd ~/dev/SubredditMediaDownloader; vim config.ini; python main.py'

#bash file rename
alias bash_name='find "$(pwd)" -type f -print0 | while IFS= read -d  file ; do newfile="$(echo "$file" | sed -E s/s+/_/tg)" ; newcmd=mv'

#ZSH THEME
alias remove-theme='sd ""$1"" ~/.zsh_favlist'
alias ez='vim -p ~/.zshrc ~.oh-my-zsh/custom/alias.zsh'
