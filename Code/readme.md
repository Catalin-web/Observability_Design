#Init steps

1. Spin up kubernetes cluster (in powershell with admin access):
`minikube start --cpus 6 --memory 7000`

Note:
- This will automatically use minikube context

2. Activate minikube tunnel (so that pods can get public ip addresses):
`minikube tunnel`


