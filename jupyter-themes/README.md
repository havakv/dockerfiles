# Themes for jupyter notebook

By some reason, the theme is stored in the browser for the given port. So you just have to build and run the container on the port you later want to use.

Note that there is some strange behaviour, so you might have to build the same images again to change profile...

docker run -p <relevant_port> --rm <container>

For more themes, check out https://github.com/dunovank/jupyter-themes and https://github.com/transcranial/jupyter-themer.
