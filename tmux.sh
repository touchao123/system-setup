
git clone --recursive https://github.com/tony/tmux-config.git ~/.tmux

# git clone --recursive https://github.com/touchao123/tmux-config.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
cd ~/.tmux
git submodule init
git submodule update
cd ~/.tmux/vendor/tmux-mem-cpu-load
mkdir build; cd build
cmake ..
make
sudo make install
cd ~
