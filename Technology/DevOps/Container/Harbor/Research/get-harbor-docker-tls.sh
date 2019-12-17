#!/bin/bash

KUBECTL_SERVER_IP=

kubectl get secret harbour-harbor-nginx -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt
kubectl get secret harbour-harbor-nginx -o jsonpath='{.data.tls\.crt}' | base64 -d > tls.cert
kubectl get secret harbour-harbor-nginx -o jsonpath='{.data.tls\.key}' | base64 -d > tls.key

sudo cp ca.crt /etc/docker/certs.d/$KUBECTL_SERVER_IP:30003
sudo cp tls.cert /etc/docker/certs.d/$KUBECTL_SERVER_IP:30003
sudo cp tls.key /etc/docker/certs.d/$KUBECTL_SERVER_IP:30003