#!/bin/bash

NODES=$(kubectl get nodes -o=jsonpath='{.items[*].metadata.name}')
for node in $NODES; do
  POD_COUNT=$(kubectl get pods --all-namespaces --field-selector=spec.nodeName=$node --no-headers | wc -l)
  if [ "$POD_COUNT" -eq "0" ]; then
    echo "No pods on node $node"
  fi
done
