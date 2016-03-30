# Just som commands used in OS X

# Start default docker machine
alias dockerstart="docker-machine start default; docker-machine env; eval $(docker-machine env)"

# Command needed for every new terminal
alias dockereval="eval $(docker-machine env)"
dockereval
