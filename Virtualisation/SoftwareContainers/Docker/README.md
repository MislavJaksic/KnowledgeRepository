## [Docker](https://www.docker.com/resources/what-container)

Docker is a containerisation program.

### [Install Docker](https://docs.docker.com/install/)

Ubuntu example:
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world

### Docker Hub/Store

Docker images can be browser, download and uploaded from and to the Hub.
There are quite a few interesting and useful images.

#### Alpine 

Doesen't have "bash"; use "sh".
Doesen't have "apt"; use "apk".
Doesen't have "netcat"; use "nc".
Interact with "sudo docker container run --interactive --tty alpine /bin/sh".

### Docker commands

docker image build [_options] _build_context_path | URL
* create a new image using Dockerfile in the build context path
* [--tag _image_name:[_tag]] Docker image name

docker container run [_options] _image_name[:_tag] [_command] [_args]
* download the _image_name if you don't have it stored
* create a container from an image
* pass and execute a command with arguments into the container
* [--name _container_name[:_tag]]               assign a name to the container
* [--interactive] required if running shell     create an interactive session; keep an STDIN open
* [--detach]                                    run container in the background
* [--publish _host_port:_container_port]        direct traffic from host port to container port 
* [--tty] required for some _commands           display terminal name (TeleTYpewriter)
* [--rm]                                        remove container after it is shutdown
* [--mount type=bind,source=_path,target=_path] mirror changes of a host source to a target inside a container; changes don't persist
* [-e _env_var=_value]                          set environment variables

docker container ls [_options]
* list all running containers
* [--all] list all containers, running or not

docker container logs _container_name[:_tag]
* fetch the logs of a container

docker container top _container_name[:_tag]
* display the running processes of a container

docker container exec [_options] _container_name[:_tag] _command
* execute a command in a running container
* [--interactive]
* [-tty]

docker container stop _container_name[:_tag]
* gracefully stop a container

docker container rm [_options] _container_name[:_tag]
* permenantly remove a container
* [--force] force shutdown and remove the container

docker login -u _docker_id -p _password
* login to Docker image registry

docker image push _image_name:[_tag]
* after logging in, upload Docker image
* [Location of uploaded Docker images](https://hub.docker.com/r/_docker_id/)



docker swarm init [_options]
* create a manager node and initialise the swarm
* lists a command for creating a worker node
* [--advertise-addr _ip] address of the swarm 

docker swarm join [_options] _ip:_port
* [--token _token] create a worker node and connect it to a swarm

docker node ls
* list the manager and worker nodes in the swarm

docker stack deploy [_options] _stack_name
* deploy or update a stack
* [--compose-file=_path] path to the Docker compose file

docker stack ls
* list all stacks

docker stack services _stack_name
* list services in a stack

docker service ps _service_name
* list service jobs

docker cp - copy a file from the host to the Docker container
Example: docker cp transfer_object.txt sandbox-hdp:/usr/transfer_object.txt