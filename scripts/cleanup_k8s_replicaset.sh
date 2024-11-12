#!/bin/bash

if [ $# != 1 ]; then
  echo "Usage: $0 namesapce"
  exit
fi

namepsace=$1

kubectl -n $namepsace delete replicaset $(kubectl get replicaset -o jsonpath='{ .items[?(@.spec.replicas==0)].metadata.name }' -n $namepsace)

