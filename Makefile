TEMP ?= $(HOME)/.cache

BUILD_CACHE ?= $(TEMP)/envoy_data_plane

ENVOY_DATA_PLANE_REPO ?= https://github.com/envoyproxy/data-plane-api.git
ENVOY_DATA_PLANE_GIT_REV ?= 78221529ed5219934ab5a79caf7b8fd4efc265e8

ENVOY_DATA_PLANE_DIR ?= $(BUILD_CACHE)/$(ENVOY_DATA_PLANE_GIT_REV)

.PHONY: build

build: $(ENVOY_DATA_PLANE_DIR)
	echo ok

$(ENVOY_DATA_PLANE_DIR):
	mkdir -p $(ENVOY_DATA_PLANE_DIR) && \
		cd $(ENVOY_DATA_PLANE_DIR) && \
		git init && \
		git remote add origin $(ENVOY_DATA_PLANE_REPO) && \
		git fetch --depth 1 origin $(ENVOY_DATA_PLANE_GIT_REV) && \
		git checkout FETCH_HEAD