# My Void XFCE Setup

Ini merupakan konfigurasi pribadi pada distribusi [Void](https://voidlinux.org/) dengan lingkungan desktop XFCE.
Sistem operasi diinstall pada flashdisk.



## Daftar isi

1. [Instalasi sistem operasi](#instalasi)
2. [Konfigurasi awal](#konfigurasi)
3. [Lanjutan](#lanjutan)



## Instalasi

1. Mengumpulkan bahan
	- `.iso` dari distribusi [Void Linux](https://voidlinux.org/)
	- [VirtualBox](https://www.virtualbox.org/) sebagai mesin virtual (`sudo xbps-install -SIu virtualbox-ose virtualbox-ose-guest`)
	- `Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack` sesuai dengan versi dari VirtualBox<br></br>

2. Menginstall sistem operasi
	- Jika terjadi error pada perizinan VirtualBox, jalankan `sudo usermod -aG vboxusers $USER`
	- Jika terjadi error pada service VirtualBox, jalankan `sudo ln -s /etc/sv/vboxservice /var/service`
	- Tambahkan dan atur [mesin baru](/home/void/Documents/Portable OS.ova)
	- Jalankan sistem operasi dari `.iso`
	- Lakukan instalasi dengan perintah `sudo void-installer`<br></br>

3. Menginstall grub hybrid untuk BIOS Legacy dan UEFI
	- Buat `.vmdk` untuk boot ke flashdisk dengan perintah `sudo vboxmanage internalcommands createrawvmdk -filename ~/usb.vmdk -rawdisk /dev/sdX` (ubah X dengan disk tujuan)
	- Berikan `$USER` akses ke `disk` dengan perintah `sudo usermod -aG disk $USER`
	- Tambahkan dan atur [mesin baru](/home/void/Documents/Boot from USB.ova)
	- Jalankan sistem operasi dari `usb.vmdk`
	- Install grub hybrid dengan perintah `sudo grub-install --force --removable --target=x86_64-efi --efi-directory=/boot --bootloader-id=Void`
	- Update grub dengan perintah `sudo update-grub`
	- Matikan mesin virtual dan sistem operasi portabel siap dipakai



## Konfigurasi

1. Perbarui repository dan paket
	```shell
	sudo xbps-install -SIu xbps
	sudo xbps-install -SIu void-repo-multilib void-repo-nonfree
	sudo xbps-install -SIu
	```

2. Pasang paket untuk kebutuhan konfigurasi
	```shell
	sudo xbps-install -SIu curl git wget
	```

3. Install [`fish-shell`](https://fishshell.com/) dan menjadikannya shell utama
	```shell
	sudo xbps-install -SIu fish-shell
	chsh -l
	chsh	# pilih directory fish, /bin/fish
	```
	- Untuk menghilangkan pesan sambutan pada `fish-shell`, jalankan `set -U fish_greeting ""`
	- Install `oh-my-fish` dengan perintah `curl -L https://get.oh-my.fish | fish`
	- Install `agnoster` dengan perintah `omf install agnoster`
	- Untuk melakukan konfigurasi `fish-shell` via peramban, jalankan `fish_config`
	- Salin [`abbr`]() ke dalam file `~/.config/fish/config.fish`  <br></br>

4. Mengatur backlight. Sumber: <https://github.com/madand/runit-services>
	```shell
	git clone https://github.com/madand/runit-services
	cd runit-services
	sudo mv backlight /etc/sv/
	sudo ln -s /etc/sv/backlight /var/service/
	```

5. Menginstall paket kebutuhan XFCE
	```shell
	sudo xbps-install -SIu ark mugshot qpdfview thunar-archive-plugin xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-whiskermenu-plugin
	```

6. Mengatur bluetooth
	```shell
	sudo xbps-install -SIu blueman
	sudo ln -s /etc/sv/bluetoothd /var/service
	```

7. Mengatur tombol super untuk xfce4-whiskermenu-plugin sekaligus jendela ubin
	```shell
	sudo xbps-install -SIu xcape
	```
	- Buka `Settings`-`Session and Startup app`-`Application Autostart`
	- Pilih `add`
		> Name: xcape\
		> Description: Map Super Keys to Alt+F1\
		> Command: /usr/bin/xcape -e 'Super_L=Alt_L|F1;Super_R=Alt_L|F1'
	- Buat shortcut xfce4-popup-whiskermenu dengan key Alt+F1<br></br>

8. Mengatur auto-mount partisi `sharing`
	```shell
	sudo blkid	# cek id dari partisi target (sharing)
	sudo mousepad /etc/fstab
	```
	- Tambahkan baris baru
		> UUID=**id_target** /home/void/**directory** vfat rw,users,uid=1000,gid=1000,defaults 0 2
	- Simpan
	- Jalankan `sudo mount -a`<br></br>

9. Mengubah waktu tunggu GRUB
	```shell
	sudo mousepad /etc/default/grub
	```
	- Ubah nilai `GRUB_TIMEOUT` menjadi `0`
	- Simpan
	- Jalankan `sudo update-grub`<br></br>

10. Mengatur LXDM
	```shell
	sudo lxdm-config
	```

11. Mengatur touchpad dengan `touchegg`
	```shell
	sudo xbps-install -SIu touchegg
	```
	- Letakkan file `touchegg.conf` ke dalam `~/.config/touchegg/`  
	



## Lanjutan

1. Menginstall paket pemakaian harian
	```shell
	sudo xbps-install -SIu gcompris-qt gnome-disk-utility htop inkscape key-mon libreoffice neofetch noto-fonts-cjk okular openjdk-jre papirus-icon-theme scratch ssr telegram-desktop vlc wine wine-32bit
	```

2. Menginstall flatpak
	```shell
	sudo xbps-install -SIu flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	```
	- Nyalakan ulang perangkat/komputer
	- Pasang pernagkat lunak yang diinginkan
	```bash
	flatpak install flathub org.zotero.Zotero
	flatpak install flathub org.gnu.pspp
	```
	> Catatan:
	>
	> Direktori plugin zotero-libreoffice ada di `/var/lib/flatpak/app/org.zotero.Zotero/x86_64/stable/90cea4833f337088f7b2226693b148a77064e27840316c9bb511a4dbdfbd3757/files/share/zotero/extensions/zoteroOpenOfficeIntegration@zotero.org/install/Zotero_OpenOffice_Integration.oxt`
	> 
	> Untuk memberi akses penyimpanan pada aplikasi flatpak jalankan `sudo flatpak override [nama_paket] --filesystem=[directory]`. Untuk menghapus akses jalankan `sudo flatpak override [nama_paket] --nofilesystem=[directory]`


3. Menginstall VPSM (lakukan dengan `fish-shell`)
	```shell
	sudo xbps-install vpsm
	set -Ux XBPS_DISTDIR $HOME/.cache/void-packages
	git clone --depth 1 https://github.com/void-linux/void-packages.git $XBPS_DISTDIR
	vpsm bb
	```

4. Mengatur config `xfce4` pada `~/.config/xfce4/`

