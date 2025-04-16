#!/bin/bash

CRDS=(
  crd-alertmanagerconfigs.yaml
  crd-alertmanagers.yaml
  crd-podmonitors.yaml
  crd-probes.yaml
  crd-prometheusagents.yaml
  crd-prometheuses.yaml
  crd-prometheusrules.yaml
  crd-scrapeconfigs.yaml
  crd-servicemonitors.yaml
  crd-thanosrulers.yaml
)

BASE_URL="https://raw.githubusercontent.com/prometheus-community/helm-charts/main/charts/kube-prometheus-stack/charts/crds/crds"

for crd in "${CRDS[@]}"; do
  echo "Applying $crd..."
  kubectl apply --server-side --force-conflicts -f "$BASE_URL/$crd"
done

echo "✅ All CRDs applied with Server-Side Apply."
