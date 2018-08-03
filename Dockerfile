FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common curl git make cmake zsh python python-dev python-pip clang
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim nodejs
RUN git clone https://github.com/shenbin04/zsh-config.git ~/.zsh && cd ~/.zsh && make install
RUN git clone https://github.com/shenbin04/vim-config.git ~/.vim && cd ~/.vim && git checkout dc807d7 && make install
RUN pip install --upgrade neovim
RUN git clone https://github.com/shenbin04/vim-demo.git ~/vim
WORKDIR ~/vim/demo
ENV TERM=xterm-256color
CMD zsh
