FROM debian:latest
MAINTAINER Rafael Robayna <rrobayna@gmail.com>

# Update and install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y sudo vim-nox tmux git wget exuberant-ctags

# Create user dev
RUN useradd dev
RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chsh -s /bin/bash dev
RUN cp /usr/share/zoneinfo/America/New_York /etc/localtime

WORKDIR /home/dev
ENV HOME /home/dev

RUN chown -R dev:dev $HOME/
USER dev

# Copy over config files
RUN git clone https://github.com/rrobayna/dotfiles.git $HOME/.dotfiles
RUN cd $HOME/.dotfiles && ./bootstrap.sh install

CMD ["/bin/bash"]
