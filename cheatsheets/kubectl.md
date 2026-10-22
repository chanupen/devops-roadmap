# kubectl

```bash
kubectl get pods -A -o wide
kubectl describe pod <pod> -n <ns>
kubectl logs <pod> -n <ns> --previous
kubectl get events -n <ns> --sort-by=.lastTimestamp
kubectl top pods -n <ns>
kubectl rollout status deploy/<name> -n <ns>
kubectl rollout undo deploy/<name> -n <ns>
kubectl auth can-i <verb> <resource> --as <user> -n <ns>
kubectl debug -it <pod> -n <ns> --image=busybox --target=<container>
```
