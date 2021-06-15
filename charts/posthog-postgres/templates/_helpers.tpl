{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "posthog.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "posthog.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "posthog.postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride -}}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.postgresql.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "posthog-postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- define "posthog.redis.fullname" -}}
{{- if .Values.redis.fullnameOverride -}}
{{- .Values.redis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.redis.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "posthog-redis" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres host
*/}}
{{- define "posthog.postgresql.host" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "posthog.postgresql.fullname" . -}}
{{- else -}}
{{- .Values.postgresql.postgresqlHost | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres secret
*/}}
{{- define "posthog.postgresql.secret" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "posthog.postgresql.fullname" . -}}
{{- else -}}
{{- template "posthog.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres secretKey
*/}}
{{- define "posthog.postgresql.secretKey" -}}
{{- if .Values.postgresql.enabled -}}
"postgresql-password"
{{- else -}}
{{- default "postgresql-password" .Values.postgresql.existingSecretKey | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres port
*/}}
{{- define "posthog.postgresql.port" -}}
{{- if .Values.postgresql.enabled -}}
    "5432"
{{- else -}}
{{- default "5432" .Values.postgresql.postgresqlPort | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set redis host
*/}}
{{- define "posthog.redis.host" -}}
{{- if .Values.redis.enabled -}}
{{- template "posthog.redis.fullname" . -}}-master
{{- else -}}
{{- .Values.redis.host | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set redis secret
*/}}
{{- define "posthog.redis.secret" -}}
{{- if .Values.redis.enabled -}}
{{- template "posthog.redis.fullname" . -}}
{{- else -}}
{{- template "posthog.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Set redis secretKey
*/}}
{{- define "posthog.redis.secretKey" -}}
{{- if .Values.redis.enabled -}}
"redis-password"
{{- else -}}
{{- default "redis-password" .Values.redis.existingSecretKey | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set redis port
*/}}
{{- define "posthog.redis.port" -}}
{{- if .Values.redis.enabled -}}
    "6379"
{{- else -}}
{{- default "6379" .Values.redis.port | quote -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "posthog.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "posthog.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
