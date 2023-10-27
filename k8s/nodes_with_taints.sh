#!/bin/bash

kubectl get nodes -o=jsonpath='{range .items[?(@.spec.taints)]}{.metadata.name}{"\n"}'
