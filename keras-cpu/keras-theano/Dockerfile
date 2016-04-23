FROM jupyter/scipy-notebook

# Install dependencies
RUN conda install --yes -p $CONDA_DIR/envs/python2 \
	'pyyaml=3.11*' \
	'hdf5=1.8*' \ 
	'h5py=2.5*' \
	'jupyter=1.0*' \
	&& conda clean -tipsy

# Installing theano as backend
RUN bash -c "source activate python2 && pip install git+git://github.com/Theano/Theano.git"

# Installing keras
RUN bash -c "source activate python2 && pip install keras"
