helm repo add sonatype https://sonatype.github.io/helm3-charts/

helm upgrade -i nexus -f values.yaml nexus-repository-manager-61.0.2.tgz -n nexus --create-namespace
