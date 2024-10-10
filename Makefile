BASE_FILE := barrettotte-resume

OUT_DIR := $(shell pwd)
PRIVATE_DIR := "$(shell pwd)/private"
SRC_DIR := "$(shell pwd)/src"

DOCKER := docker
IMAGE := barrettotte-resume

default: build

clean:
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.log $(OUT_DIR)/*.out $(OUT_DIR)/*.pdf
	rm -f $(PRIVATE_DIR)/*.aux $(PRIVATE_DIR)/*.log $(PRIVATE_DIR)/*.out $(PRIVATE_DIR)/*.pdf

image:
	@echo "Building image $(IMAGE)"
	$(DOCKER) build -t $(IMAGE) -f docker/Dockerfile .

rebuild_image:
	@echo "Rebuilding image $(IMAGE)"
	$(DOCKER) build --no-cache -t $(IMAGE) -f docker/Dockerfile .

build:
	@echo "Building general resume - $(BASE_FILE).pdf"
	$(DOCKER) run \
		--env-file template.env \
		-e "RESUME_NAME=$(BASE_FILE)" \
		--rm \
		-v $(OUT_DIR):/out -v ./src:/src \
		$(IMAGE)

build_private:
	@echo "Building private resume - $(BASE_FILE)-private.pdf"
	$(DOCKER) run \
		--env-file .env \
		-e "RESUME_NAME=$(BASE_FILE)-private" \
		--rm \
		-v $(PRIVATE_DIR):/out -v ./src:/src \
		$(IMAGE)
