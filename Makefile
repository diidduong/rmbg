VERSION=v1
DOCKERUSER=diidduong

GCLOUD_PROJECT=diidduong
REPO=rmbg
REGION=us-west2
IMAGE=rmbg
IMAGE_TAG=${REGION}-docker.pkg.dev/${GCLOUD_PROJECT}/${REPO}/${IMAGE}

build:
	docker build . -t ${IMAGE}
push:
	docker tag ${REPO} $(DOCKERUSER)/${IMAGE}:$(VERSION)
	docker push $(DOCKERUSER)/${IMAGE}:$(VERSION)

pushg:
	docker buildx build . -t ${IMAGE_TAG} --platform linux/amd64
	docker push ${IMAGE_TAG}