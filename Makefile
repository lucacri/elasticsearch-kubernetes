TAG ?= 6.6.0
IMAGE := lucacri/elasticsearch-kubernetes

build:
	@echo "------------------"
	@echo "BUILDING: "
	@echo "${IMAGE}:${TAG}"
	@echo "------------------"
	@echo ""
	@echo ""
	@docker build --pull -t ${IMAGE}:${TAG} .
	@docker tag ${IMAGE}:${TAG} ${IMAGE}:latest

push:
	@echo "------------------"
	@echo "PUSHING: "
	@echo "${IMAGE}:${TAG}"
	@echo "------------------"
	@echo ""
	@echo ""
	@docker push ${IMAGE}:${TAG}
	@docker push ${IMAGE}:latest