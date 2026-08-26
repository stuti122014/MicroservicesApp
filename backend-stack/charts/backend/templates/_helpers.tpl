{{/*
Backend name
*/}}

{{- define "backend.name" -}}

{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}

{{- end }}


{{/*
Backend fullname
*/}}

{{- define "backend.fullname" -}}

{{- if .Values.fullnameOverride }}

{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}

{{- else }}

{{- printf "%s-%s" .Release.Name (include "backend.name" .) | trunc 63 | trimSuffix "-" }}

{{- end }}

{{- end }}


{{/*
Backend labels
*/}}

{{- define "backend.labels" -}}

app.kubernetes.io/name: {{ include "backend.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: backend

app.kubernetes.io/managed-by: {{ .Release.Service }}

{{- end }}


{{/*
Backend selector labels
*/}}

{{- define "backend.selectorLabels" -}}

app.kubernetes.io/name: {{ include "backend.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: backend

{{- end }}


{{/*
Shared database secret
*/}}

{{- define "backend.databaseSecretName" -}}

{{ .Release.Name }}-database-secrets

{{- end }}


{{/*
Shared SecretProviderClass
*/}}

{{- define "backend.secretProviderClassName" -}}

{{ .Release.Name }}-azure-keyvault

{{- end }}


{{/*
Shared ServiceAccount
*/}}

{{- define "backend.serviceAccountName" -}}

{{ .Values.global.workloadIdentity.serviceAccountName | default "backend-workload-identity" }}

{{- end }}