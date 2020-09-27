echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null

gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2  # Default: -1
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false # Default: true

tracker reset --hard  
