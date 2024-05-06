#!/bin/bash

set -x

kubectl get pods \
  --all-namespaces \
  -o jsonpath='{range .items[*]}{"\n"}{range .spec.containers[*]}{.image}{"\n"}{end}{end}' \
  | sort | uniq \
  | grep "registry.sirius.online/" \
  | grep -E ".*:.{0,20}$" > ./images.list
