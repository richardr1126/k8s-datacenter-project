cd gke-cluster && \
uv run gke-cluster.py create && \
cd helm && \
rm -rf ~/.kube/config && \
gcloud container clusters get-credentials cost-optimized-cluster --zone us-central1-b --project datacenter-computing && \
./install-apps.sh && \
cd ../../nats-firehose-ingest/charts && \
./create-secrets.sh && \
helm upgrade --install nats-firehose-ingest ./nats-firehose-ingest --set image.tag=latest && \
cd ../../nats-stream-processor/charts && \
./create-secrets.sh && \
helm upgrade --install nats-stream-processor ./nats-stream-processor --set image.tag=latest && \
cd ../../bsky-sentiment-web/charts && \
./create-secrets.sh && \
helm upgrade --install bsky-sentiment-web ./bsky-sentiment-web --set image.tag=latest