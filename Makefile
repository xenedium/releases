IMG := $(REGISTRY)/poc-gitops/${SERVICE_NAME}:$(VERSION)

build-image:
	docker build -t ${IMG} -f Dockerfile .

push-image:
	docker push ${IMG}
