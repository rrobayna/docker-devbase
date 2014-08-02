docker-devbase
==

Linux development container for working with volumes in a structured docker
development environment.  This container includes git, vim, tmux, plugins and
config files.

## Usage

Extend this development container and link to your environment's shared volumes.

## Building

The container is configured to use the *make* build too.

To build the docker image:
```bash
make
```

To generate a container:
```bash
make run
```






