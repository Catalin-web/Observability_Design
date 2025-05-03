#Init steps

1. Spin up kubernetes cluster (in powershell with admin access):
`minikube start --cpus 8 --memory 10000 --driver=docker`

Note:
- This will automatically use minikube context
- Disable checkpoint + shadow copy in hyperv

2. Activate minikube tunnel (so that pods can get public ip addresses):
`minikube tunnel`


