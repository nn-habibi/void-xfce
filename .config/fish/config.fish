if status is-interactive
    # Commands to run in interactive sessions can go here
	abbr -a -U -- .. 'cd ..'
	abbr -a -U -- ... 'cd ../..'
	abbr -a -U -- .... 'cd ../../..'
	abbr -a -U -- ..... 'cd ../../../..'
	abbr -a -U -- autoclean 'sudo xbps-remove -Oov'
	abbr -a -U -- c clear
	abbr -a -U -- chgrp 'chgrp --preserve-root'
	abbr -a -U -- chmod 'chmod --preserve-root'
	abbr -a -U -- chown 'chown --preserve-root'
	abbr -a -U -- clean 'sudo rm -rf /var/cache/xbps/*'
	abbr -a -U -- clone 'git clone --depth 1'
	abbr -a -U -- cp 'cp -iv'
	abbr -a -U -- deps 'xbps-query -vRx'
	abbr -a -U -- df 'df -H'
	abbr -a -U -- disk 'lsblk -o name,tran,type,fstype,fsavail,fsused,fsuse%,size,label,mountpoint,model'
	abbr -a -U -- du 'du -ch'
	abbr -a -U -- e 'exit 0'
	abbr -a -U -- ff 'fc-cache -fv'
	abbr -a -U -- fget 'flatpak install flathub'
	abbr -a -U -- fremove 'flatpak uninstall'
	abbr -a -U -- filelist 'xbps-query --regex -Rf'
	abbr -a -U -- flathub 'flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
	abbr -a -U -- forceget 'sudo xbps-install -Sf'
	abbr -a -U -- forceremove 'sudo xbps-remove -Rf'
	abbr -a -U -- g git
	abbr -a -U -- ga 'git add'
	abbr -a -U -- gcm 'git commit -m'
	abbr -a -U -- gco 'git checkout'
	abbr -a -U -- gcob 'git checkout -b'
	abbr -a -U -- gd 'git diff --color=always'
	abbr -a -U -- get 'sudo xbps-install'
	abbr -a -U -- gi 'git init'
	abbr -a -U -- glg 'git log --graph --oneline --decorate --all'
	abbr -a -U -- gm 'git merge'
	abbr -a -U -- gp 'git push'
	abbr -a -U -- gpl 'git pull'
	abbr -a -U -- gs 'git status -sbu'
	abbr -a -U -- gst 'git stash'
	abbr -a -U -- gstl 'git stash list'
	abbr -a -U -- h history
	abbr -a -U -- info 'xbps-query -R'
	abbr -a -U -- installed 'xbps-query -lv'
	abbr -a -U -- ll 'ls -Nlh --color=auto --group-directories-first'
	abbr -a -U -- meminfo 'free -mlt'
	abbr -a -U -- mkd 'mkdir -pv'
	abbr -a -U -- mv 'mv -iv'
	abbr -a -U -- reconfigure 'sudo xbps-reconfigure -v'
	abbr -a -U -- remove 'sudo xbps-remove -R'
	abbr -a -U -- repolist 'xbps-query -Lv'
	abbr -a -U -- rm 'rm -Idv'
	abbr -a -U -- search 'xbps-query -vRs'
	abbr -a -U -- searchlocal 'xbps-query -vs'
	abbr -a -U -- su 'sudo -i'
	abbr -a -U -- update 'sudo xbps-install -S'
	abbr -a -U -- upgrade 'sudo xbps-install -SIu'
	abbr -a -U -- vget 'vpsm i'
	abbr -a -U -- vsearch 'vpsm ss'
	abbr -a -U -- vremove 'vpsm un'
	abbr -a -U -- vshow 'vpsm sw'
	abbr -a -U -- vupdate 'vpsm upr'
	abbr -a -U -- vupgrade 'vpsm bu'
	abbr -a -U -- wget 'wget -c'
end
