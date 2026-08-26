{{/*
Parent chart name
*/}}

{{- define "backend-stack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Parent chart fullname
*/}}

{{- define "backend-stack.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "backend-stack.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Common labels
*/}}

{{- define "backend-stack.labels" -}}

app.kubernetes.io/name: {{ include "backend-stack.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/managed-by: {{ .Release.Service }}

helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}

{{- end }}


{{/*
Shared ServiceAccount name
*/}}

{{- define "backend-stack.serviceAccountName" -}}
{{ .Values.azure.workloadIdentity.serviceAccountName }}
{{- end }}


{{/*
Shared secret name
*/}}

{{- define "backend-stack.secretName" -}}
{{ .Release.Name }}-database-secrets
{{- end }}


{{/*
Shared SecretProviderClass name
*/}}

{{- define "backend-stack.secretProviderClassName" -}}
{{ .Release.Name }}-azure-keyvault
{{- end }}