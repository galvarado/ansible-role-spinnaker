cat > spinnaker-sa.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: spinnaker

---

apiVersion: v1
kind: ServiceAccount
metadata:
  name: spinnaker-service-account
  namespace: spinnaker

---

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: spinnaker-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: spinnaker-service-account
  namespace: spinnaker
EOF

kubectl apply -f spinnaker-sa.yaml
kubectl config set-context --current --namespace=spinnaker
kubectl get serviceaccounts