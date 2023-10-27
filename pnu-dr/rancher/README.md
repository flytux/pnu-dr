helm repo add rancher-latest https://releases.rancher.com/server-charts/latest 
helm upgrade -i rancher rancher-latest/rancher \
--set hostname=rancher-dr.pnu.ac.kr --set bootstrapPassword=admin \
--set replicas=1 --set global.cattle.psp.enabled=false \
--create-namespace -n cattle-system


admin /QnfRhc20#@!!

