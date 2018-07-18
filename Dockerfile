FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y software-properties-common curl git make cmake zsh python python-dev python-pip clang
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim nodejs
RUN git clone https://github.com/soweyln/zsh-config.git ~/.zsh && cd ~/.zsh && make install
RUN git clone https://github.com/soweyln/vim-config.git ~/.vim && cd ~/.vim && git checkout 95a3265 && make install
RUN pip install --upgrade neovim
WORKDIR /root/demo
ENV TERM=xterm-256color
CMD zsh
