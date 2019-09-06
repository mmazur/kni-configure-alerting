apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: pd-secret
  namespace: openshift-monitoring
data:
  PAGERDUTY_KEY: 
