

VERSION = 0.1

ORG = yesworkflow
REPO = provenance-demo 
IMAGE = ${ORG}/${REPO}

build:
	echo Build untagged image so that it is automatically tagged 'latest'
	docker build -t ${IMAGE} .
	echo Tag new image with current version number: ${VERSION}
	docker tag -f ${IMAGE} ${IMAGE}:${VERSION}

push:
	echo Push to Docker Hub the specified version of the image: ${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker push ${IMAGE}:latest

pull:
	echo Pull from Docker Hub the specified version of the image: ${VERSION}
	docker pull ${IMAGE}:${VERSION}

run:
	echo Interactively run the specified version of the image: ${VERSION}
	docker run -it -v $(HOME):$(HOME) ${IMAGE}:${VERSION}
