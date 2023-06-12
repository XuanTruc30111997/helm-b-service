{{- define "image.registry" -}}
{{- printf "%s/%s-%s" .Values.image.repository .Values.image.prefix .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}