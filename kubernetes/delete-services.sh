#!/bin/bash -e

kubectl delete --filename services/nginx-proxy.yml || true
