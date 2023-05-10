{{/*
Expand the name of the chart.
*/}}
{{- define "fecru.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fecru.fullname" -}}
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
{{- define "fecru.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "fecru.labels" -}}
helm.sh/chart: {{ include "fecru.chart" . }}
{{ include "fecru.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "fecru.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fecru.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "fecru.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "fecru.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "fecru.volumeClaimTemplates" -}}
{{- if or .Values.volumes.localHome.persistentVolumeClaim.create .Values.fecru.additionalVolumeClaimTemplates }}
volumeClaimTemplates:
{{- if .Values.volumes.localHome.persistentVolumeClaim.create }}
- metadata:
    name: local-home
  spec:
    accessModes: [ "ReadWriteOnce" ]
    {{- if .Values.volumes.localHome.persistentVolumeClaim.storageClassName }}
    storageClassName: {{ .Values.volumes.localHome.persistentVolumeClaim.storageClassName | quote }}
    {{- end }}
    {{- with .Values.volumes.localHome.persistentVolumeClaim.resources }}
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}
{{- end }}
{{- range .Values.additionalVolumeClaimTemplates }}
- metadata:
    name: {{ .name }}
  spec:
    accessModes: [ "ReadWriteOnce" ]
    {{- if .storageClassName }}
    storageClassName: {{ .storageClassName | quote }}
    {{- end }}
    {{- with .resources }}
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}
{{- end }}
{{- end }}
{{- end }}

{{ define "volumeMounts" }}
- name: local-home
  mountPath: {{ .Values.volumes.localHome.mountPath | quote }}
{{ end }}
