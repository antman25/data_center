helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm upgrade -i --create-namespace -n nginx-ingress nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true
