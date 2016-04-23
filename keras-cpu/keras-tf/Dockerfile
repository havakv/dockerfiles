FROM jupyter/scipy-notebook

# Install dependencies
RUN conda install --yes -p $CONDA_DIR/envs/python2 \
	'pyyaml=3.11*' \
	'hdf5=1.8*' \ 
	'h5py=2.5*' \
	'jupyter=1.0*' \
	&& conda clean -tipsy

# Installing tensorflow as backend
# python 2.7
RUN bash -c "source activate python2 && pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp27-none-linux_x86_64.whl"

# python 3
#RUN pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp34-cp34m-linux_x86_64.whl


# Installing keras
# python 2.7
RUN bash -c "source activate python2 && pip install keras"

#python 3
#RUN pip install keras

ENV KERAS_BACKEND=tensorflow
