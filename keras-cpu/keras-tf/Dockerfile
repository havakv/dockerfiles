FROM datascience

# Install dependencies
RUN conda install --yes \
	'pyyaml=3.11*' \
	'hdf5=1.8*' \ 
	'h5py=2.5*' \
	'jupyter=1.0*' \
	&& conda clean -tipsy

# Installing tensorflow as backend
RUN export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.10.0-cp35-cp35m-linux_x86_64.whl \
    && pip install --ignore-installed --upgrade $TF_BINARY_URL

# Installing keras
RUN git clone https://github.com/fchollet/keras.git \
    && cd keras \
    && python setup.py install

ENV KERAS_BACKEND=tensorflow
