imageName = caiman/devbase:latest
containerName = devbase

all: dbuild 

dbuild: 
	docker build --rm -t $(imageName) .

buildclean:
	docker build --rm --no-cache=true -t $(imageName) .

run:
	docker run -ti --name $(containerName) $(imageName)

start:
	docker start -ai $(containerName)
