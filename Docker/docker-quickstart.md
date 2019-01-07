
<img src="https://www.docker.com/sites/default/files/social/docker_twitter_share_new.png?4362984378" width=200>

# Docker QuickStart

This guide is indended to provide users with basic information required to set up programming environments by running docker containers using NYCDSA's pre-built docker images. 

## 1. What is Docker

Docker is a computer program that runs software packages called "containers". Containers bundle their own tools, libraries and configuration files. Containers allow users to package an application with all of its dependencies into a standardized unit for software development or deployment. Containers are created from "images" that specify their precise contents.

### Images & Containers

- **Image**: an executable package that includes everything needed to run an application - the code, a runtime, libraries, environment variables, and configuration files.
  - You can choose to build your own images or to use existing ones 
  - For all our courses, the docker images (Linux-based) have already been built and you only need to pull them from Docker Hub.

- **Container**: a runtime instance of an image - what the image becomes in memory when executed (that is, an image with state, or a user process).
  - Once you have the image pulled on your computer, you can start the container from Docker engine
  - Containers isolate software from its environment and ensure that it works uniformly no matter where and when you run it.

<img class="image" src="https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-and-vm-transparent-bg.png" height="300px" align="middle">

## 2. How to Use Docker

To use docker you need to:

1. make sure Docker is installed and running on your system
2. pull the image that contains the environment/applications you need
3. start a container
4. you can then use the container just like use a computer with pre-built environment and applications

If you already have docker installed on your computer and know how to use it, you can skip this part and jump to **3. Example: setting up linux environment and running jupyter notebook**

### 2.1.a Install Docker

- Follow the <a href="https://docs.docker.com/install/" target="_blank">instruction</a> or the links below to install Docker:
  - [Install Docker for MAC](https://docs.docker.com/docker-for-mac/install/)
  - [Install Docker for Windows](https://docs.docker.com/docker-for-windows/install/)

- If you use docker for Mac/Windows, the docker IP is `localhost` or `127.0.0.1`.

### 2.1.b Install Docker Toolbox (Legacy desktop solution)

- For older Mac and Windows systems that do not meet minimal system requirements for running Docker, you can install <a href="https://docs.docker.com/toolbox/toolbox_install_windows/" target="_blank">Docker Toolbox</a> which runs docker inside Oracle VM VirtualBox.
  - To install Docker Toolbox, download and run the **Docker Toolbox Setup Wizard** and accept all the default settings.
  - When finish, double click the **Docker QuickStart Terminal** to start the interactive shell, which might take a few minutes to get ready.
  - When the shell is ready, follow the same instruction for Mac because the terminal is similar to bash. 

- If you use Docker toolbox, your IP address is the VM's IP. By default, it's `192.168.99.100`, you can also find it by running the command below inside the Docker QuickStart Terminal: 

  ```
  docker-machine ip
  ```

- Troubleshooting:
  - If your Docker Toolbox takes too long to start, you might need to go to **Oracle VM VirtualBox** (installed along with your Docket Toolbox) and allowcate more Memory and Processors in **Settings** -> **System**. The recommended settings are: 
    - Base Memory: 2 GB or more
    - Processors: 2 or more
  
### 2.2 Pull Docker Images

To run an container, you need to download the image first. Most popular images are available on Docker Hub (similar to Github). Please first sign up on <a href="https://hub.docker.com/" target="_blank">Docker Hub</a> and then start the docker service by clicking the lovely whale icon.

Open the command line interface (CLI) that's available to you, (**terminal** for MAC users, **Command Prompt** for Windows users, and **Docker QuickStart Terminal** for Docker Toolbox users) and run:

```
docker pull <docker IMAGE>
```

It might take a while to download the image depending on the size of the images and your internet speed. You only need to pull the same image once and it will be saved on your computer unless deleted.

Once the image is downloaded, you can check the image's IMAGE ID and REPOSITORY by executing the following command:

```
docker image ls
```

For images that are no longer needed, you can delete them from your computer. To delete a docker image, first find its IMAGE ID (or REPOSITORY) by running the command above, then do:

```
docker image rm <IMAGE ID>
```

### 2.3 Run a Container

The command to run a docker container can include different options:

```
docker run -it -d --rm \
-p hostPort:containerPort \
-v host-src:container-dest \
<docker IMAGE> 
bash
```

Options:
- `-it` runs a container in interactive processes.
- `-d` (optional) runs a container in the background in detached mode
- `--rm` (optional) removes the container when it exits or when the daemon exits.
- `-p hostPort:containerPort` (optional) forwards a container᾿s port to the host.
- `-v host-src:container-dest` (optional) mounts a host directory the container so files can be shared between them. 
- `bash` (optional) starts the command line of the container in the terminal. 
  - Depending how the image was built, you may or may not need it.

### 2.4 Stop a container

To stop a container you simple type `exit` inside a container, and it will automatically stop.

### 2.5 Remove a stopped container

If you didn't use `--rm` flag when you start a container, then you need to manually remove it. 

- to remove a stopped container, you first need to find the CONTAINER ID via:

  ```
  docker ps -a
  ```

- then run:

  ```
  docker container rm -f <CONTAINER ID>
  ```

## 3. Example: setting up linux environment and running jupyter notebook

[`nycdsa/linux-toolkits`](https://hub.docker.com/r/nycdsa/linux-toolkits/) is a Linux (Ubuntu 16.04) based docker image with Python 3, MySQL, and Jupyter notebook installed. In this example we will start a container by executing the image and then run a jupyter notebook inside the container and access it from the host machine.

1. Pull image `nycdsa/linux-toolkits` from Docker hub. 

  ```
  docker pull nycdsa/linux-toolkits
  ```

2. If you're using Docker Toolbox, then by default, the IP is `192.168.99.100`. You can also find it by executing:

  ```
  docker-machine ip
  ```

3. Change your working directory to a directory where you want to be working in, e,g,. where data, notebooks, etc. are saved, and then run docker container:

  - MAC, Linux and Docker Toolbox:

  ```
  docker run -it \
  -p 8888:8888 \
  -v "$(pwd)":/home/ubuntu/Workspace \
  nycdsa/linux-toolkits
  ```

  - Windows:
  
  ```
  docker run -it ^
  -p 8888:8888 ^
  -v %cd%:/home/ubuntu/Workspace ^
  nycdsa/linux-toolkits
  ```

  - **Note**:
  
    - `$(pwd)` or `%cd%` represents the current *working directory* on the host for MAC/Linux and Windows, respectively, and `-v` mounts it with the directory `/home/ubuntu/Workspace` in your container. It's not recommended to mount an important directory, e.g., your home directory or the root directory, to the container.
    - `\` and `^` are new line escape characters for MAC/Linux and Windows, respectively. If your command fits in one line then you should remove them.

4. Run `jupyter notebook` inside the container and then copy the URL to your browser:

  - For MAC/Windows users: http://127.0.0.1:8888
  - For Docker Toolbox users: http://192.168.99.100:8888
    - If the docker-machine uses a different IP, then replace the IP with what you find from step 2.

5. From the CLI window where Docker container is running, press `Ctrl+C` twice will quit the Jupyter notebook, type `exit` and hit *ENTER* will stop the container.

6. Once the container is stopped, remove it by finding it's ID and then executing:

  ```
  docker container rm <container id>
  ```

## 4. Recap and cheat sheet

```
## List Docker CLI commands
docker image --help
docker container --help

## Docker image commands
docker image ls -a              # List all images on this machine
docker image rm <image id>      # Remove specified image from this machine
docker image rm $(docker image ls -a -q)  # Remove all images from this machine

## Start/enter a container
docker run -it <image id>
docker run -it -p 8888:8888 <image id>  # Map port 8888 to 8888
docker run -it -v "$(pwd)":/home/ubuntu/workspace <image id> # bind host's wd to container's /home/ubuntu/workspace
docker restart <container id>           # restart a container
docker exec -it <container id> bash     # re-enter a container

## Docker container commands
docker container ls                   # List all running containers
docker container ls -a                # List all containers, even those not running
docker container stop <container id>  # Gracefully stop the specified container
docker container kill <container id>  # Force shutdown of the specified container
docker container rm <container id>    # Remove specified stopped container from this machine
docker container rm -f <container id> # Force remove specified container from this machine
docker container rm $(docker container ls -a -q) # Remove all stopped containers
```
