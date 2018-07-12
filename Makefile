# Copyright (c) 2017, NVIDIA CORPORATION. All rights reserved.

DOCKER ?= docker

VERSION := 2.0.3
PKG_REV := 1
RUNTIME_VERSION := 2.0.0

DIST_DIR  := $(CURDIR)/dist

.NOTPARALLEL:
.PHONY: all

all: ubuntu18.04 ubuntu16.04 ubuntu14.04 debian9 debian8 centos7 amzn2 amzn1

ubuntu18.04: $(addsuffix -ubuntu18.04, 18.03.1 17.12.1)

ubuntu16.04: $(addsuffix -ubuntu16.04, 18.03.1 18.03.0 17.12.1 17.12.0 17.09.1 17.09.0 17.06.2 17.03.2 1.13.1 1.12.6)

ubuntu14.04: $(addsuffix -ubuntu14.04, 18.03.1 18.03.0 17.12.1 17.09.1 17.06.2 17.03.2)

debian9: $(addsuffix -debian9, 18.03.1 18.03.0 17.12.1 17.12.0 17.09.1 17.09.0 17.06.2 17.03.2)

debian8: $(addsuffix -debian8, 18.03.1 18.03.0 17.12.1 17.09.1 17.06.2)

centos7: $(addsuffix -centos7, 18.03.1.ce 18.03.0.ce 17.12.1.ce 17.12.0.ce 17.09.1.ce 17.09.0.ce 17.06.2.ce 17.03.2.ce 1.13.1 1.12.6)

amzn2: $(addsuffix -amzn2, 17.06.2.ce)

amzn1: $(addsuffix -amzn1, 18.03.1.ce 17.12.1.ce 17.09.1.ce 17.06.2.ce 17.03.2.ce)

opensuse_leap15.0: $(addsuffix -opensuse_leap15.0, 17.09.1_ce)

opensuse_leap42.3: $(addsuffix -opensuse_leap42.3, 17.09.1_ce)

18.03.1-ubuntu18.04:
	$(DOCKER) build --build-arg VERSION_ID="18.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker18.03.1-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= 18.03.1~ce~3-0~ubuntu) | docker-ee (= 18.03.1~ee~3-0~ubuntu)" \
                        --build-arg PKG_VERS="$(VERSION)+docker18.03.1" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:18.04-docker18.03.1" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu18.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:18.04-docker18.03.1"

17.12.1-ubuntu18.04:
	$(DOCKER) build --build-arg VERSION_ID="18.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker17.12.1-1" \
                        --build-arg DOCKER_VERSION="docker.io (= 17.12.1-0ubuntu1)" \
                        --build-arg PKG_VERS="$(VERSION)+docker17.12.1" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:18.04-docker17.12.1" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu18.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:18.04-docker17.12.1"

%-ubuntu16.04:
	$(DOCKER) build --build-arg VERSION_ID="16.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker$*-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= $*~ce-0~ubuntu) | docker-ee (= $*~ee-0~ubuntu)" \
                        --build-arg PKG_VERS="$(VERSION)+docker$*" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:16.04-docker$*" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu16.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:16.04-docker$*"

17.03.2-ubuntu16.04:
	$(DOCKER) build --build-arg VERSION_ID="16.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker17.03.2-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= 17.03.2~ce-0~ubuntu-xenial) | docker-ee (= 17.03.2~ee-0~ubuntu-xenial)" \
                        --build-arg PKG_VERS="$(VERSION)+docker17.03.2" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:16.04-docker$*" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu16.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:16.04-docker$*"

1.13.1-ubuntu16.04:
	$(DOCKER) build --build-arg VERSION_ID="16.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker1.13.1-1" \
                        --build-arg DOCKER_VERSION="docker-engine (= 1.13.1-0~ubuntu-xenial) | docker.io (= 1.13.1-0ubuntu1~16.04.2)" \
                        --build-arg PKG_VERS="$(VERSION)+docker1.13.1" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:16.04-docker1.13.1" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu16.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:16.04-docker1.13.1"

1.12.6-ubuntu16.04:
	$(DOCKER) build --build-arg VERSION_ID="16.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker1.12.6-1" \
                        --build-arg DOCKER_VERSION="docker-engine (= 1.12.6-0~ubuntu-xenial) | docker.io (= 1.12.6-0ubuntu1~16.04.1)" \
                        --build-arg PKG_VERS="$(VERSION)+docker1.12.6" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:16.04-docker1.12.6" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu16.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:16.04-docker1.12.6"

%-ubuntu14.04:
	$(DOCKER) build --build-arg VERSION_ID="14.04" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker$*-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= $*~ce-0~ubuntu) | docker-ee (= $*~ee-0~ubuntu)" \
                        --build-arg PKG_VERS="$(VERSION)+docker$*" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/ubuntu:14.04-docker$*" -f Dockerfile.ubuntu .
	$(DOCKER) run --rm -v $(DIST_DIR)/ubuntu14.04:/dist:Z "nvidia/nvidia-docker2/ubuntu:14.04-docker$*"

%-debian9:
	$(DOCKER) build --build-arg VERSION_ID="9" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker$*-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= $*~ce-0~debian)" \
                        --build-arg PKG_VERS="$(VERSION)+docker$*" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/debian:9-docker$*" -f Dockerfile.debian .
	$(DOCKER) run --rm -v $(DIST_DIR)/debian9:/dist:Z "nvidia/nvidia-docker2/debian:9-docker$*"

17.03.2-debian9:
	$(DOCKER) build --build-arg VERSION_ID="9" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker17.03.2-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= 17.03.2~ce-0~debian-stretch)" \
                        --build-arg PKG_VERS="$(VERSION)+docker17.03.2" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/debian:9-docker17.03.2" -f Dockerfile.debian .
	$(DOCKER) run --rm -v $(DIST_DIR)/debian9:/dist:Z "nvidia/nvidia-docker2/debian:9-docker17.03.2"

%-debian8:
	$(DOCKER) build --build-arg VERSION_ID="8" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)+docker$*-1" \
                        --build-arg DOCKER_VERSION="docker-ce (= $*~ce-0~debian)" \
                        --build-arg PKG_VERS="$(VERSION)+docker$*" \
                        --build-arg PKG_REV="$(PKG_REV)" \
                        -t "nvidia/nvidia-docker2/debian:8-docker$*" -f Dockerfile.debian .
	$(DOCKER) run --rm -v $(DIST_DIR)/debian8:/dist:Z "nvidia/nvidia-docker2/debian:8-docker$*"

%.ce-centos7:
	$(DOCKER) build --build-arg VERSION_ID="7" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*" \
                        --build-arg DOCKER_VERSION="docker-ce = $*.ce" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*.ce" \
                        -t "nvidia/nvidia-docker2/centos:7-docker$*.ce" -f Dockerfile.centos .
	$(DOCKER) run --rm -v $(DIST_DIR)/centos7:/dist:Z "nvidia/nvidia-docker2/centos:7-docker$*.ce"

%-centos7:
	$(DOCKER) build --build-arg VERSION_ID="7" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*" \
                        --build-arg DOCKER_VERSION="docker = 2:$*" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*" \
                        -t "nvidia/nvidia-docker2/centos:7-docker$*" -f Dockerfile.centos .
	$(DOCKER) run --rm -v $(DIST_DIR)/centos7:/dist:Z "nvidia/nvidia-docker2/centos:7-docker$*"

%.ce-amzn2:
	$(DOCKER) build --build-arg VERSION_ID="2" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*.amzn2" \
                        --build-arg DOCKER_VERSION="docker = $*ce" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*.ce.amzn2" \
                        -t "nvidia/nvidia-docker2/amzn:2-docker$*" -f Dockerfile.amzn .
	$(DOCKER) run --rm -v $(DIST_DIR)/amzn2:/dist:Z "nvidia/nvidia-docker2/amzn:2-docker$*"

%.ce-amzn1:
	$(DOCKER) build --build-arg VERSION_ID="1" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*.amzn1" \
                        --build-arg DOCKER_VERSION="docker = $*ce" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*.ce.amzn1" \
                        -t "nvidia/nvidia-docker2/amzn:1-docker$*" -f Dockerfile.amzn .
	$(DOCKER) run --rm -v $(DIST_DIR)/amzn1:/dist:Z "nvidia/nvidia-docker2/amzn:1-docker$*"

%_ce-opensuse_leap15.0:
	$(DOCKER) build --build-arg VERSION_ID="15.0" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*" \
                        --build-arg DOCKER_VERSION="docker = $*_ce" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*_ce" \
                        -t "nvidia/nvidia-docker2/opensuse/leap:15.0-docker$*.ce" -f Dockerfile.opensuse_leap .
	$(DOCKER) run --rm -v $(DIST_DIR)/opensuse_leap15.0:/dist:Z "nvidia/nvidia-docker2/opensuse/leap:15.0-docker$*.ce"

%_ce-opensuse_leap42.3:
	$(DOCKER) build --build-arg VERSION_ID="42.3" \
                        --build-arg RUNTIME_VERSION="$(RUNTIME_VERSION)-1.docker$*" \
                        --build-arg DOCKER_VERSION="docker = $*_ce" \
                        --build-arg PKG_VERS="$(VERSION)" \
                        --build-arg PKG_REV="$(PKG_REV).docker$*_ce" \
                        -t "nvidia/nvidia-docker2/opensuse/leap:42.3-docker$*.ce" -f Dockerfile.opensuse_leap .
	$(DOCKER) run --rm -v $(DIST_DIR)/opensuse_leap42.3:/dist:Z "nvidia/nvidia-docker2/opensuse/leap:42.3-docker$*.ce"
