link_dep wsl.sh

# trying to start stuff automatically is incredibly jank in wsl
sudo cp -f $(pwd)/00-wsl.conf /etc/sudoers.d/00-wsl
# cp -f $(pwd)/wsl.bat $APP_DATA/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/wsl.bat
