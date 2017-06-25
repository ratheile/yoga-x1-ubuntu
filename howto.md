Install
http://thinkwiki.de/TLP_-_Linux_Stromsparen for battery management

sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo apt-get install tp-smapi-dkms acpi-call-dkms

systemctl enable tlp.service
systemctl enable tlp-sleep.service

systemctl enable NetworkManager-dispatcher.service

systemctl mask systemd-rfkill.service
