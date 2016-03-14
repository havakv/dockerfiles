FROM jupyter/minimal-notebook

USER root

# Install jupyter-themer
RUN pip install jupyter-themer

USER jovyan

# Get default theme
RUN jupyter-themer
