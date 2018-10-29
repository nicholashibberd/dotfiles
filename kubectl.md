# Kubectl

Connect to latest deployment pod

```
kubectl exec -it `kubectl get pods | grep deployment | awk '{print $1}'` /bin/bash
```
