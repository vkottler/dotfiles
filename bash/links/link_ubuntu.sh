# need to re-evaluate if this is something worth doing

if command -v gsettings >/dev/null; then
	gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2  # Default: -1
	gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false # Default: true
fi

if command -v tracker >/dev/null; then
	tracker reset --hard
fi
