gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2  # Default: -1
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false # Default: true

tracker reset --hard  
