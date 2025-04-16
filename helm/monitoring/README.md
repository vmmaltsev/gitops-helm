# Monitoring Helm Chart

Этот чарт разворачивает kube-prometheus-stack через ArgoCD.

## Основные компоненты
- Prometheus
- Grafana
- Alertmanager

## Использование

1. Обновите зависимости:
   ```bash
   helm dependency update ./helm/monitoring
   ```
2. ArgoCD автоматически применит изменения из ApplicationSet.

## Настройка

Все параметры kube-prometheus-stack можно переопределять через values.yaml. 