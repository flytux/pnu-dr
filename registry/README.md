helm repo add twuni https://helm.twun.io
helm install docker-registry -f values.yaml twuni/docker-registry -n registry --create-namespace
