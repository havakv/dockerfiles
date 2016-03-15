FROM ubuntu:14.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	vim \ 
	texlive-latex-base \
	texlive \
    	texlive-latex-extra \
	latex-xcolor \
	pgf \
	texlive-lang-norwegian \
    	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-fonts-recommended \
	texlive-generic-recommended \
	texlive-xetex \
	texlive-full \ 
	&& apt-get clean
	

# Get us locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen "en_US.UTF-8"

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

# Configure container startup
WORKDIR /home/$USER/mnt
CMD ["/bin/bash"]

# Add local .vimrc
COPY .vimrc /home/$USER/.vimrc

USER $USER

