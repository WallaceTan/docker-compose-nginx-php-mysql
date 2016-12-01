#!/bin/bash
ORG=govtech-ai
IMG=nginx
TAG=$ORG/$IMG
docker rmi $TAG
docker build --rm=true --tag=$TAG .
