#!/bin/bash
TAG=latest
docker build docker -f docker/dev.x86_64.dockerfile -t ai-playground:$TAG
