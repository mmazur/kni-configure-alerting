apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: dms-secret
  namespace: openshift-monitoring
data:
  SNITCH_URL: 
