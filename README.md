# GitOps Helm Charts

Этот репозиторий содержит Helm-чарты для микросервисного приложения и конфигурацию ArgoCD ApplicationSets.

## Структура проекта

```
gitops-helm/
├── applicationset-demo-apps.yaml  - ApplicationSet для деплоя всех приложений demo-app
├── applicationset-monitoring.yaml - ApplicationSet для мониторинга
├── helm/
    ├── common/                    - Общие шаблоны и функции для переиспользования
    ├── api-golang/                - Бэкенд на Golang
    ├── api-node/                  - Бэкенд на Node.js
    └── client-react/              - Фронтенд на React
```

## Функциональность

- `common` чарт предоставляет общие шаблоны и хелперы
- Поддержка автомасштабирования с HPA
- PodDisruptionBudget для обеспечения доступности
- Настройки ресурсов для оптимальной производительности
- Стратегии развертывания для zero-downtime обновлений
- Конфигурации через ConfigMaps
- Секреты для чувствительных данных

## Использование

1. Установите приложения через ArgoCD:
   ```
   kubectl apply -f applicationset-demo-apps.yaml
   kubectl apply -f applicationset-monitoring.yaml
   ```

2. Настройка инфраструктуры:
   - Ingress доступен по адресу: app.maltsevtech.com
   - Микросервисы: api-golang, api-node, client-react

## Ручная установка (для тестирования)

```bash
helm dependency update ./helm/api-golang
helm install api-golang ./helm/api-golang -n demo-app

helm dependency update ./helm/api-node
helm install api-node ./helm/api-node -n demo-app

helm dependency update ./helm/client-react
helm install client-react ./helm/client-react -n demo-app
``` 