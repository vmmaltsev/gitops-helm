{{/* Common labels */}}
{{- define "common.labels" -}}
app: {{ .app }}
{{- if .component }}
component: {{ .component }}
{{- end }}
{{- if .release }}
release: {{ .release }}
{{- end }}
{{- end -}}

{{/* Pod resources */}}
{{- define "common.resources" -}}
resources:
  requests:
    cpu: {{ .requests.cpu | default "50m" }}
    memory: {{ .requests.memory | default "64Mi" }}
  limits:
    cpu: {{ .limits.cpu | default "100m" }}
    memory: {{ .limits.memory | default "128Mi" }}
{{- end -}}

{{/* Pod probes */}}
{{- define "common.probes" -}}
{{- if .readiness }}
readinessProbe:
  httpGet:
    path: {{ .readiness.path | default "/health" }}
    port: {{ .port }}
  initialDelaySeconds: {{ .readiness.initialDelaySeconds | default 5 }}
  periodSeconds: {{ .readiness.periodSeconds | default 10 }}
{{- end }}
{{- if .liveness }}
livenessProbe:
  httpGet:
    path: {{ .liveness.path | default "/health" }}
    port: {{ .port }}
  initialDelaySeconds: {{ .liveness.initialDelaySeconds | default 15 }}
  periodSeconds: {{ .liveness.periodSeconds | default 20 }}
{{- end }}
{{- end -}}

{{/* Deployment strategy */}}
{{- define "common.strategy" -}}
strategy:
  type: {{ .type | default "RollingUpdate" }}
  {{- if eq (.type | default "RollingUpdate") "RollingUpdate" }}
  rollingUpdate:
    maxSurge: {{ .maxSurge | default 1 }}
    maxUnavailable: {{ .maxUnavailable | default 0 }}
  {{- end }}
{{- end -}} 