FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y software-properties-common curl git make cmake zsh python python-dev python-pip python3-pip clang
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim nodejs
RUN pip3 install --upgrade neovim
RUN git clone https://github.com/shenbin04/zsh-config.git ~/.zsh && cd ~/.zsh && git checkout 33832da && make install
RUN git clone https://github.com/shenbin04/vim-config.git ~/.vim && cd ~/.vim && git checkout 8e0ba14 && ./install.sh
WORKDIR /root/vim
ENV TERM=xterm-256color
CMD zsh
