# Bosh Prometheus Exporter

This is a step by step guide about how to install bosh exporter and scrape data into Prometheus.

### Installing Bosh Exporter

```
wget https://github.com/bosh-prometheus/bosh_exporter/releases/download/v3.1.0/bosh_exporter-3.1.0.linux-amd64.tar.gz
tar -xvzf bosh_exporter-3.1.0.linux-amd64.tar.gz
cd bosh_exporter-3.1.0.linux-amd64

cat <<EOF >>bosh-ca
-----BEGIN CERTIFICATE-----
-----END CERTIFICATE-----
EOF

./bosh_exporter  --metrics.environment=test --bosh.ca-cert-file=/home/ubuntu/bosh_exporter-3.1.0.linux-amd64/bosh-ca \
  --bosh.url=https://$BOSH_IP/25555 --bosh.uaa.client-id=admin --bosh.uaa.client-secret=$BOSH_CLIENT_SECRET
```

It should listen from port 9190.

### Configuring Prometheus

For this case, we have a Prometheus installed on K8S. A service, endpoint and service monitor is going to be created by running:

```
kubectl apply -f bosh-exporter-ep.yaml
kubectl apply -f bosh-exporter-svc.yaml
kubectl apply -f bosh-exporter-sm.yaml
```


### Creating Grafana Dashboards

Example dashboards in the dasboards folder can be imported.
