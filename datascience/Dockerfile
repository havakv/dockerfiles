FROM jupyter/datascience-notebook

ENV USER jovyan

USER $USER
#-------------------------------------------------
# Update conda to make sure we have mkl
RUN conda update -y conda &&\
	conda update -y mkl &&\
	conda update -y numpy
#RUN bash -c "source activate python2 && conda update -y mkl && conda update -y numpy"

# Need this to use pandas.query
#RUN bash -c "source activate python2 && conda install -y -c https://conda.anaconda.org/pandas numexpr && conda update pandas"

#-------------------------------------------------
# Add vim to notebooks
RUN cd /opt/conda/share/jupyter/nbextensions && \
        git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
        jupyter nbextension enable vim_binding/vim_binding

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
RUN git clone https://github.com/vim-scripts/xoria256.vim.git && \
        mkdir -p $HOME/.vim && \
        mv xoria256.vim/colors $HOME/.vim/ && \
        rm -rf xoria256.vim && \
        echo "export TERM=xterm-256color" >> $HOME/.bashrc 

# Get vundle and plugins
RUN mkdir -p /home/$USER/.vim/bundle/vundle && \
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
        export TERM=xterm-256color && \
        vim +BundleList +qall && \
        vim +BundleInstall +qall && \
        mkdir -p $HOME/.vim/ftplugin
COPY python.vim $HOME/.vim/ftplugin/python.vim
    



#-------------------------------------------------
# Adding aditional R packages
#conda install conda-build
#conda skeleton cran sand
#conda build r-sand
