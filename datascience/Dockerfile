FROM jupyter/datascience-notebook

ENV USER jovyan

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

# Get vundle
RUN mkdir -p /home/$USER/.vim/bundle/vundle && \
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
	vim +BundleList +qall

# Install plugins
RUN vim +BundleInstall +qall

#-------------------------------------------------
# Need this to use pandas.query
RUN bash -c "source activate python2 && conda install -c https://conda.anaconda.org/pandas numexpr && conda update pandas"


#-------------------------------------------------
# Adding aditional R packages
#conda install conda-build
#conda skeleton cran sand
#conda build r-sand
