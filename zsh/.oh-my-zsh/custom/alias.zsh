# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr


##System
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

##docker
alias dsr='docker container stop $(docker container ls -aq); docker container rm $(docker container ls -aq)'
alias dri='docker rmi $(docker images -aq)'
alias ds='sudo systemctl start docker'

##Security
alias logz='sudo find /var/log/ -type f \( -name "*.log" \) -exec tail -f "$file" {} +'
alias sys-scan='sudo freshclam; sudo clamscan -r / --exclude-dir="/mnt/" --exclude-dir="/run/timeshift/" --log=/tmp/clamav_report.log'
alias audit='cd ~/.scripts/xfrom_source/lynis-master/; sudo ./lynis audit system'
alias inf='gpg -d ~/Documents/i'

##Packages
alias pkgs='yay -Qqe > ~/.config/pkglist.txt'
alias clean-pkgs='sudo pacman -R $(pacman -Qdtq)'
alias yays="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

##ZSH
alias rb='source ~/.bashrc'
alias rz='source ~/.zshrc'
alias ez='vim -p ~/.zshrc ~/.oh-my-zsh/custom/alias.zsh'
alias va='cat ~/.oh-my-zsh/custom/alias.zsh | rg -A 20 "^##.*"'

##fix terminal
alias fixur='xrdb ~/.Xresources'

##Font Cache Refresh
alias rf='fc-cache -f -v'
alias fl='fc-list | grep "~/.fonts/"'

##Git
alias gi='git init'
alias gs='git status'
alias ga='git add -A'
alias gcm='git commit -m'
alias gpll='git pull'
alias dotg='cd ~/dotfiles/; git status'
alias gc='git clone'
alias gen-readme='npx readme-md-generator'

##python
alias py='source ~/.venv/bin/activate'
alias ca='conda activate'
alias cel='conda env list'
alias cr='conda env list; echo "env: "; read env; conda env remove -n $env'
alias ccr='conda create -n'

##stow
alias tlinks='stow --adopt -nv'
alias clinks='stow --adopt -v'

##ProtonVPN
alias prof='sudo protonvpn c -f'
alias pros='sudo protonvpn c --sc'
alias prot='sudo protonvpn c --tor -p tcp'
alias pror='protonvpn refresh'
alias prod='sudo protonvpn d'

##Firefox
alias firefox='/usr/lib/firefox/firefox-bin'
alias uff='pkill firefox-bin; sudo rm -rf /usr/lib/firefox_old; sudo mv /usr/lib/firefox /usr/lib/firefox_old; sudo cp -r ~/Downloads/firefox /usr/lib/'
alias dff='sudo rm -rf /usr/lib/firefox_old; rm -rf ~/Downloads/firefox*'

##feh image
alias feh='feh --scale-down --auto-zoom'
alias feh-ss='nohup feh -Z -. -D 3'

##Colors
alias col='cb-small; colorpanes; colorline && hex && hex-block && colortest && colorblocks && colorbars'

##Youtube-DL
alias yd='cd /mnt/TB_2/Media/yd; youtube-dl --restrict-filenames'
alias ydm='youtube-dl --restrict-filenames --extract-audio --embed-thumbnail --audio-format mp3'

##Figlet
alias yo='figlet -f ~/.fonts/misc/figlet/3D-ASCII.flf'
alias yo2='figlet -f ~/.fonts/misc/figlet/isometric.flf'
alias fig='font="$(ls -d ~/.fonts/misc/figlet/* | shuf | tail -n1)"; figlet -f "$font"'

##Shred
alias shreddit='shred --iterations=5 --remove=wipe --zero --verbose'

##XRDM
alias cs='xrdm color'
alias tf='xrdm font'

##YTFZF
alias yt='ytfzf -tT'

##Reddit
alias reddit='rtv'

##Disk Utility
alias disk-util='ncdu'

##pwgen
alias pwg='pwgen -scny $@'

##k-reset
alias k-reset='sudo kubeadm reset; sudo rm -rf /etc/cni/net.d; rm ~/.kube/config; sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X; prof; sudo systemctl restart kubelet; sudo iptables --list; sudo systemctl status kubelet'

##ip
alias ip-flush='sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X'
alias ip-list='sudo iptables --list'
alias vip='ifconfig | rg -A 5 proton0 | rg "inet " | sd "netmask.*" "" | sd "inet" "" | sd " " ""'

##neo
alias nfa='neofetch --ascii "$(figlet -f ~/.fonts/misc/figlet/isometric.flf T)"'

##Bash File Rename
alias bash_name='find "$(pwd)" -type f -print0 | while IFS= read -d  file ; do newfile="$(echo "$file" | sed -E s/s+/_/tg)" ; newcmd=mv'

##Media
alias not-flix='conda activate flix; python ~/dev/flix-cli/flix-cli.py'
alias anime-titties='zerotwo; ani-cli'
alias esrgan='conda activate esr; cd ~/dev/Real-esr-gan; real-esr-gan $@'
alias manga-flix='mangal'
alias flip-vid='ffmpeg -i $1 -vf transpose=2 -c:a copy output.mp4'
alias rvm='python inference.py --variant resnet50 --checkpoint checkpoint/rvm_resnet50.pth --device cuda --input-source input/input.mp4 --output-type video --output-composition output/com.mp4 --output-alpha output/alp.mp4 --output-foreground output/for.mp4 --output-video-mbps 10 --seq-chunk 1'

##MISC
alias lsc='ls -latrh --time=birth'
alias gcb='xclip -out -selection clipboard'
alias ev="fd $1 -X vim {}"
alias ec="fd $1 -X bat {}"
alias cat="bat"

alias nmap_open_ports="nmap --open"
alias nmap_list_interfaces="nmap --iflist"
alias nmap_slow="sudo nmap -sS -v -T1"
alias nmap_fin="sudo nmap -sF -v"
alias nmap_full="sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4"
alias nmap_ping_through_firewall="nmap -PS -PA"
alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
alias nmap_detect_versions="sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
alias nmap_check_for_vulns="nmap --script=vuln"
alias nmap_full_udp="sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
alias nmap_traceroute="sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all " 
alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "
alias nmap_ping_scan="nmap -n -sP"

alias rofi-shot='rofi -show drun -normal-window & disown'
alias ui-pics='montage -shadow -background '#c397d8' -geometry +20+20 -tile 2x *.png montage.png'
#alias ls='exa --long --all --group --icons --sort=accessed'
#alias exa='exa --long --all --group --icons --sort=accessed --git'
alias sl='exa --long --all --group --icons --sort=accessed --git'
