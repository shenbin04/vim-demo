FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y software-properties-common curl git make cmake zsh python python-dev python-pip python3-pip clang
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim nodejs
RUN pip3 install --upgrade neovim
RUN git clone https://github.com/shenbin04/zsh-config.git ~/.zsh && cd ~/.zsh && git checkout 4c3194c && make install
RUN git clone https://github.com/shenbin04/vim-config.git ~/.vim && cd ~/.vim && git checkout b237840 && ./install.sh
RUN git clone https://github.com/shenbin04/vim-demo.git ~/vim
WORKDIR /root/vim/demo
ENV TERM=xterm-256color
CMD zsh
