#!/bin/bash

set -euo pipefail  # strict mode

if [ "$#" -gt 1 ]; then
    echo >&2 "usage: ./build.sh [latest|stable|...]"
    exit 1
fi

set -x  # verbose mode on

# === Configuration variables ===
IMAGE_TAG=${1:-"latest"}
# ===


ECR_REGISTRY=my_aws_ecr_registry
ECR_REPOSITORY=grow-in-module-telegraf

aws ecr --profile armen get-login-password --region eu-north-1 | docker login --username AWS --password-stdin ${ECR_REGISTRY}

docker buildx build --platform linux/arm/v6 --load -t ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG} .

docker push ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
