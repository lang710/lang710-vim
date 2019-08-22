#!/usr/bin/env bash

#    MIT License
#
#    Copyright (c) 2019 lang710
#
#    Permission is hereby granted, free of charge, to any person obtaining a copy
#    of this software and associated documentation files (the "Software"), to deal
#    in the Software without restriction, including without limitation the rights
#    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#    copies of the Software, and to permit persons to whom the Software is
#    furnished to do so, subject to the following conditions:
#
#    The above copyright notice and this permission notice shall be included in all
#    copies or substantial portions of the Software.
#
#    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#    SOFTWARE.

############################  SETUP ZSH
cd ~
yum install -y zsh
which zsh >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
  echo "zsh is abnormal!"
  exit
fi

############################  SWITCH TO ZSH
chsh -s /bin/zsh

############################  CONFIG ZSH (oh-my-zsh!)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

############################  INSTALL THE AUTOMATIC PROMPT PLUGIN
wget http://mimosa-pudica.net/src/incr-0.2.zsh
mkdir ~/.oh-my-zsh/plugins/incr
mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc

############################  INSTALL autojump
git clone git://github.com/joelthelion/autojump.git
cd autojump
python install.py
echo '[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc

source ~/.zshrc


############################  SETUP VIM
yum remove -y vim-enhanced
wget https://github.com/vim/vim/archive/v8.0.1365.tar.gz
tar zxvf v8.0.1365.tar.gz && cd vim-8.0.1365/src/
make && make install

############################  CONFIG VIM (spf13-vim)
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh
source spf13-vim.sh
echo 'set tags=tags' >> ~/.vimrc.local
echo 'set autochdir' >> ~/.vimrc.local
echo 'let g:solarized_termcolors=16' >> ~/.vimrc.local
echo 'color solarized' >> ~/.vimrc.local
