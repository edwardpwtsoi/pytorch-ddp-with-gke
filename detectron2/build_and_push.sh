#!/bin/bash
docker build -f Dockerfile -t "powatsoi/detectron2:k8s" ./
docker push powatsoi/detectron2:k8s
