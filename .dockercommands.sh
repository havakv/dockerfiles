# A file containing docker commands


# Start default docker machine
alias dockerstart="docker-machine start default; docker-machine env; eval $(docker-machine env)"

# Command needed for every new terminal
alias dockereval="eval $(docker-machine env)"
dockereval

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


