{{/*
PostgreSQL name
*/}}

{{- define "postgres.name" -}}

{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}

{{- end }}


{{/*
PostgreSQL fullname
*/}}

{{- define "postgres.fullname" -}}

{{- if .Values.fullnameOverride }}

{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}

{{- else }}

{{- printf "%s-%s" .Release.Name (include "postgres.name" .) | trunc 63 | trimSuffix "-" }}

{{- end }}

{{- end }}


{{/*
PostgreSQL labels
*/}}

{{- define "postgres.labels" -}}

app.kubernetes.io/name: {{ include "postgres.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: postgres

app.kubernetes.io/managed-by: {{ .Release.Service }}

{{- end }}


{{/*
PostgreSQL selector labels
*/}}

{{- define "postgres.selectorLabels" -}}

app.kubernetes.io/name: {{ include "postgres.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: postgres

{{- end }}


{{/*
Shared database secret
*/}}

{{- define "postgres.databaseSecretName" -}}

{{ .Release.Name }}-database-secrets

{{- end }}


{{/*
Shared SecretProviderClass
*/}}

{{- define "postgres.secretProviderClassName" -}}

{{ .Release.Name }}-azure-keyvault

{{- end }}