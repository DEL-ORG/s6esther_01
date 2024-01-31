{{/*
Expand the name of the chart.
*/}}
{{- define "s6esther-espresso-shop-web3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "s6esther-espresso-shop-web3.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "s6esther-espresso-shop-web3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "s6esther-espresso-shop-web3.labels" -}}
{{ include "s6esther-espresso-shop-web3.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "s6esther-espresso-shop-web3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "s6esther-espresso-shop-web3.name" . }}
version: v1
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "s6esther-espresso-shop-web3.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "s6esther-espresso-shop-web3.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
