FROM jupyter/minimal-notebook

# Install jupyter_environment_kernels
RUN pip install environment_kernels \
	&& echo "\n\nc.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" >>  ~/.jupyter/jupyter_notebook_config.py \
	&& echo "c.EnvironmentKernelSpecManager.env_dirs=['$CONDA_DIR/envs']" >>  ~/.jupyter/jupyter_notebook_config.py


