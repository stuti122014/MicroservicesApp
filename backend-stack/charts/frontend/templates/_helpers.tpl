{{/*
Frontend name
*/}}

{{- define "frontend.name" -}}

{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}

{{- end }}


{{/*
Frontend fullname
*/}}

{{- define "frontend.fullname" -}}

{{- if .Values.fullnameOverride }}

{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}

{{- else }}

{{- printf "%s-%s" .Release.Name (include "frontend.name" .) | trunc 63 | trimSuffix "-" }}

{{- end }}

{{- end }}


{{/*
Frontend labels
*/}}

{{- define "frontend.labels" -}}

app.kubernetes.io/name: {{ include "frontend.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: frontend

app.kubernetes.io/managed-by: {{ .Release.Service }}

{{- end }}


{{/*
Frontend selector labels
*/}}

{{- define "frontend.selectorLabels" -}}

app.kubernetes.io/name: {{ include "frontend.name" . }}

app.kubernetes.io/instance: {{ .Release.Name }}

app.kubernetes.io/component: frontend

{{- end }}