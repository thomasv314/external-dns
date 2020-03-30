#!/bin/bash

go build -o extdnslocal main.go

./extdnslocal \
    --kubeconfig=/Users/tvendetta/.kube/config \
    --log-level=info \
    --log-format=text \
    --dry-run \
    --domain-filter=dev.syapse.com \
    --policy=sync \
    --provider=aws \
    --registry=txt \
    --interval=1m \
    --source=service \
    --source=ingress \
    --source=istio-virtualservice \
    --source=istio-gateway \
    --aws-batch-change-size=100 \
    --fqdn-template={{.Name}}.dev.syapse.com
