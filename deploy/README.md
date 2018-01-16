### TODO:
* postgres persisted volume
* mailchimp keys

### Usage:

`kubectl apply -f .kube/app-secrets.yml`

`kubectl edit secret/app-secrets`

`kubectl apply -R -f deploy/`

Run shell in container: `kubectl exec -it pod-id -- bash`

Expose deployment from minikube:

```
kubectl expose deployment nginx-deployment --type=NodePort
minikube service nginx-deployment
```
