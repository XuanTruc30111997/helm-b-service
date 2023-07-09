{{- define "image.registry" -}}
{{- printf "%s/%s-%s" .Values.image.repository .Values.image.prefix .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common label for resource */}}
{{- define "common.labels" }}
app.kubernetes.io/name: {{ template "deployment.name" . }}
{{- include "chart.labels.part" . }}
{{- end }}

{{- define "chart.labels" }}
{{- include "common.labels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}

{{- define "chart.labels.part" }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end }}

{{- define "deployment.name" }}
{{- if .Values.strategy.canary.enabled }}
{{- printf "%s-%s" .Chart.Name .Values.strategy.canary.namePrefix | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- printf "%s" .Chart.Name }}
{{- end -}}
{{- end }}

{{- define "config.name" -}}
{{- printf "%s-config" (include "deployment.name" .) }}
{{- end }}

{{- define "ingress.name" -}}
{{- printf "%s-ingress" (include "deployment.name" .) }}
{{- end }}

{{- define "service.name" -}}
{{- printf "%s-" (include "deployment.name" .) }}
{{- end }}

{{- define "ingress.canary.annotations" }}
{{- if .Values.strategy.canary.enabled }}
nginx.ingress.kubernetes.io/canary: "{{ .Values.strategy.canary.enabled }}"
nginx.ingress.kubernetes.io/canary-weight: "{{ .Values.strategy.canary.weight }}"
{{- end}}
{{- end }}

