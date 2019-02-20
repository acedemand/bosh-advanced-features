echo $BOSH_CLIENT_SECRET
bbl director-address
mkdir -p 
bbl director-address > ~/dev/tools_data>ca.crt
docker run -d --name prometheus-exporter -p 9190:9190 \
-v ~/dev/tools_data/ca/:/certs \
-e BOSH_EXPORTER_BOSH_CA_CERT_FILE=/certs/ca.crt \
-e BOSH_EXPORTER_BOSH_URL=https://10.0.0.6:25555 \
-e BOSH_EXPORTER_METRICS_ENVIRONMENT=test \
-e BOSH_EXPORTER_BOSH_UAA_CLIENT_ID=admin \
-e BOSH_EXPORTER_BOSH_UAA_CLIENT_SECRET=$BOSH_CLIENT_SECRET \
boshprometheus/bosh-exporter
