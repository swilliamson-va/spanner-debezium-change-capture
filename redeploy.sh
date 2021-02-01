POD_NAME=$(kubectl get pods --selector=service=connect -o jsonpath='{.items..metadata.name}')
POD_IP=$(kubectl get pods --selector=service=connect -o jsonpath='{.items..podIP}')

kubectl exec -ti $POD_NAME -- curl -X POST http://$POD_IP:8083/connectors -H "Content-Type: application/json" -d @/config/source.json
