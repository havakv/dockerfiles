FROM ubuntu:16.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	vim \ 
	texlive-latex-base \
	texlive \
    	texlive-latex-extra \
	latex-xcolor \
	pgf \
	#texlive-lang-norwegian \
    	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-fonts-recommended \
	texlive-generic-recommended \
	texlive-xetex \
	texlive-full \ 
	&& apt-get clean
	

# Get us locale
#RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    #locale-gen "en_US.UTF-8"

# Configure environment
ENV SHELL /bin/bash
ENV USER havakv
ENV UID 1000
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create jovyan user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $UID $USER

USER $USER

# Set up mount point
RUN mkdir /home/$USER/mnt

USER root

#-------------------------------------------------
# Install vim 
RUN apt-get update && apt-get install -y \
        vim-gtk \
        build-essential cmake \
        python-dev \
        python3-dev

USER $USER

# Add local .vimrc
COPY .vimrc /home/$USER/.vimrc
USER root
RUN chown $USER /home/$USER/.vimrc
USER $USER

# Add colorscheme
RUN git clone https://github.com/vim-scripts/xoria256.vim.git /home/$USER/xoria256.vim && \
        mkdir -p /home/$USER/.vim && \
        mv /home/$USER/xoria256.vim/colors /home/$USER/.vim/ && \
        rm -rf /home/$USER/xoria256.vim && \
        echo "export TERM=xterm-256color" >> /home/$USER/.bashrc 

# Get vundle and plugins
RUN mkdir -p /home/$USER/.vim/bundle/vundle && \
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
        export TERM=xterm-256color && \
        vim +BundleList +qall && \
        vim +BundleInstall +qall 

# Configure container startup
WORKDIR /home/$USER/mnt
CMD ["/bin/bash"]

USER $USER

