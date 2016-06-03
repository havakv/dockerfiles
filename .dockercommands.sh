# A file containing docker commands

# Stop all running
dstopall(){
	docker stop $(docker ps -a -q)
}

# Remove all containers
drmall(){
	docker rm $(docker ps -a -q)
}


dataBash() {
	docker run -v $(pwd):/home/jovyan/work --rm -it datascience /bin/bash
}

# Start datascience image
datascience() {
	if [ -z "$1" ]
	then 
		echo "need output port, e.g. 8888"
	else
		open http://$(docker-machine ip):$1
		path=$(pwd)
		docker run -v $path:/home/jovyan/work -p $1:8888 --rm datascience
	fi
}

# Start datascience image
path_from_home=$(echo $HOME/dockerfiles/path_from_home.py)
dsvim() {
	if [ -z "$1" ]
	then 
		echo "need file"
	else
		path=$($path_from_home)
		#Should find a way to source the .bashrc file!!!!!!
		docker run -v ~/:/home/jovyan/work --rm -it datascience /bin/bash -c "export TERM=xterm-256color && cd $path && vim $1"
	fi
}

# Set theme on port <$1> to space legos
jupyterDark() {
	if [ -z "$1" ]
	then	
		echo "need output port, e.g. 8888"
	else
		path=$(pwd)
		docker run  -p $1:8888 --rm jupyter-space-legos-theme
	fi
}

# Run pdflatex from container
dpdflatex() {
	if [ -z "$1" ]
	then	
		echo "need file"
	else
		docker run --rm -v $(pwd):/home/havakv/mnt -it latex /bin/bash -c "pdflatex $1"
	fi
}

# Run xelatex from container
dxelatex() {
	path=$(pwd)
	if [ -z "$1" ]
	then	
		echo "need file"
	else
		docker run --rm -v $path:/home/havakv/mnt -it latex /bin/bash -c "xelatex $1"
	fi
}

dlatexvim() {
	docker run --rm -v $(pwd):/home/havakv/mnt -it latex /bin/bash
}

