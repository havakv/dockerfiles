FROM jupyter/all-spark-notebook

ENV USER jovyan

USER jovyan

RUN cd /opt/conda/share/jupyter/nbextensions && \
	git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
	jupyter nbextension enable vim_binding/vim_binding

#-------------------------------------------------
# Need this to use pandas.query
RUN bash -c "source activate python2 && conda install -c https://conda.anaconda.org/pandas numexpr && conda update pandas"

