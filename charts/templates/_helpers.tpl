{{- define "image.registry" -}}
{{- printf "%s/%s-%s" .Values.image.repository .Values.image.prefix .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.labels" }}
app.kubernetes.io/name: {{ .Chart.Name }}
{{- end }}

{{- define "chart.labels" }}
{{- include "common.labels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end }}
