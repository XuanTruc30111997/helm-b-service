{{- define "image.registry" -}}
{{- printf "%s/%s-%s" .Values.image.repository .Values.image.prefix .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common label for resource */}}
{{- define "common.labels" }}
{{- include "chart.labels.part" . }}
app.label: {{ template "deployment.active" . }}
{{- end }}

{{- define "chart.labels" }}
{{- include "common.labels" . }}
app.kubernetes.io/name: {{ template "deployment.name" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}

{{- define "chart.labels.part" }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end }}

{{/* Service name for deployment */}}
{{- define "service.name" }}
{{- printf "%s" .Chart.Name }}
{{- end }}

{{- define "deployment.name" }}
{{- if .Values.strategy.canary.enabled }}
{{- printf "%s-%s" .Chart.Name .Values.strategy.canary.namePrefix | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- if .Values.strategy.blueGreen.enabled }}
{{- printf "%s-%s" .Chart.Name (include "deployment.active" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- printf "%s-%s" .Chart.Name (include "deployment.active" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}
{{- end }}

{{- define "deployment.active" }}
{{- if .Values.strategy.blueGreen.enabled }}
{{- printf "blue" }}
{{- else -}}
{{- printf "green" }}
{{- end -}}
{{- end }}

{{- define "service.selector.active" }}
{{- include "chart.labels.part" . }}
app.label: "{{ .Values.strategy.blueGreen.active }}"
{{- end }}

{{- define "config.name" -}}
{{- printf "%s-config" (include "deployment.name" .) }}
{{- end }}

{{- define "ingress.name" -}}
{{- printf "%s-ingress" (include "deployment.name" .) }}
{{- end }}

{{- define "ingress.canary.annotations" }}
{{- if .Values.strategy.canary.enabled }}
nginx.ingress.kubernetes.io/canary: "{{ .Values.strategy.canary.enabled }}"
nginx.ingress.kubernetes.io/canary-weight: "{{ .Values.strategy.canary.weight }}"
{{- end}}
{{- end }}

{{- define "service.annotations" }}
"helm.sh/resource-policy": keep
{{- end }}

{{- define "deployment.annotations" }}
checksum/config: {{ include (print $.Template.BasePath "/configMap.yaml") . | sha256sum }}
{{- end }}
