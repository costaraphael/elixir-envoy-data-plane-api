TEMP ?= $(HOME)/.cache

BUILD_CACHE ?= $(TEMP)/envoy_data_plane

ENVOY_DATA_PLANE_REPO ?= https://github.com/envoyproxy/data-plane-api.git
ENVOY_DATA_PLANE_GIT_REV ?= 6fa6303db13d734c0c0271c37cf029c6f3fd0fc1

ENVOY_DATA_PLANE_DIR ?= $(BUILD_CACHE)/$(ENVOY_DATA_PLANE_GIT_REV)

gen: $(ENVOY_DATA_PLANE_DIR)
	buf generate $(ENVOY_DATA_PLANE_DIR) --include-imports --path $(ENVOY_DATA_PLANE_DIR)/envoy

	rm gen/google/api/http.pb.ex
	rm gen/google/api/pb_extension.pb.ex

$(ENVOY_DATA_PLANE_DIR):
	mkdir -p $(ENVOY_DATA_PLANE_DIR) && \
		cd $(ENVOY_DATA_PLANE_DIR) && \
		git init && \
		git remote add origin $(ENVOY_DATA_PLANE_REPO) && \
		git fetch --depth 1 origin $(ENVOY_DATA_PLANE_GIT_REV) && \
		git checkout FETCH_HEAD

clean:
	rm -rf gen $(ENVOY_DATA_PLANE_DIR)