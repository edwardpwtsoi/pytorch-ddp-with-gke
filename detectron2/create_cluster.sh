#!/bin/bash
name_of_your_cluster="pytorch-ddp-training-on-gke"
gcloud container clusters create $name_of_your_cluster \
   --num-nodes=2 \
   --zone=asia-east1-c \
   --cluster-version=1.15 \
   --accelerator="type=nvidia-tesla-t4,count=1" \
   --machine-type="n1-standard-4" \
# install gpu drivers across all machines
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/container-engine-accelerators/master/nvidia-driver-installer/cos/daemonset-preloaded.yaml
# install nvidia device plugin
kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v1.11/nvidia-device-plugin.yml
