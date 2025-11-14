#!/usr/bin/env bash

BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S %Z')

# Ansible 12 + Python 3.12 (latest: 12.2)
# Ansible 11 + Python 3.11 (latest: 11.12)

docker buildx build \
  --load \
  --network host \
  --progress=auto \
  --build-arg "PYTHON_VERSION=3.12" \
  --build-arg "ANSIBLE_VERSION=12.2.0" \
  --build-arg "AUTHORS=Laszlo Malina <laszlo@optimode.hu>" \
  --build-arg "URL=https://github.com/optimode/ansible" \
  --build-arg "SOURCE=https://github.com/optimode/ansible" \
  --build-arg "VENDOR=optimode" \
  --build-arg "REVISION=" \
  --build-arg "BUILD_DATE=${BUILD_DATE}" \
  --tag optimode/ansible:12 \
  --tag optimode/ansible:12.2 \
  --tag optimode/ansible:latest \
  --file Dockerfile  \
  .
