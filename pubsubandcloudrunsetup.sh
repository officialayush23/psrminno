#!/bin/bash
# setup_pubsub.sh
PROJECT=your-gcp-project-id
REGION=asia-south1

gcloud config set project $PROJECT

# ── Create topics ────────────────────────────────────────────────
for topic in \
    ps-crm-complaint-received \
    ps-crm-workflow-events \
    ps-crm-notifications \
    ps-crm-surveys \
    ps-crm-agent-tasks; do
    gcloud pubsub topics create $topic --project=$PROJECT
    echo "Created topic: $topic"
done

# ── Dead letter topic for failed messages ────────────────────────
gcloud pubsub topics create ps-crm-dead-letter --project=$PROJECT

# ── Subscriptions (push to Cloud Run — URL filled in after deploy) ──
# These are created as pull first; you'll update the push endpoint
# after `gcloud run deploy` gives you the URL.

gcloud pubsub subscriptions create ps-crm-complaint-received-sub \
    --topic=ps-crm-complaint-received \
    --ack-deadline=60 \
    --message-retention-duration=7d \
    --dead-letter-topic=ps-crm-dead-letter \
    --max-delivery-attempts=5 \
    --project=$PROJECT

gcloud pubsub subscriptions create ps-crm-workflow-events-sub \
    --topic=ps-crm-workflow-events \
    --ack-deadline=120 \
    --message-retention-duration=7d \
    --dead-letter-topic=ps-crm-dead-letter \
    --max-delivery-attempts=5 \
    --project=$PROJECT

gcloud pubsub subscriptions create ps-crm-notifications-sub \
    --topic=ps-crm-notifications \
    --ack-deadline=60 \
    --message-retention-duration=3d \
    --dead-letter-topic=ps-crm-dead-letter \
    --max-delivery-attempts=3 \
    --project=$PROJECT

gcloud pubsub subscriptions create ps-crm-surveys-sub \
    --topic=ps-crm-surveys \
    --ack-deadline=60 \
    --message-retention-duration=7d \
    --project=$PROJECT

# ── After Cloud Run deploy, run this to switch to push ───────────
# CLOUD_RUN_URL=$(gcloud run services describe ps-crm-api \
#     --region=$REGION --format='value(status.url)')
#
# gcloud pubsub subscriptions modify-push-config ps-crm-notifications-sub \
#     --push-endpoint=$CLOUD_RUN_URL/pubsub/notifications \
#     --push-auth-service-account=ps-crm-pubsub@$PROJECT.iam.gserviceaccount.com
#
# gcloud pubsub subscriptions modify-push-config ps-crm-workflow-events-sub \
#     --push-endpoint=$CLOUD_RUN_URL/pubsub/workflow-events \
#     --push-auth-service-account=ps-crm-pubsub@$PROJECT.iam.gserviceaccount.com
#
# gcloud pubsub subscriptions modify-push-config ps-crm-surveys-sub \
#     --push-endpoint=$CLOUD_RUN_URL/pubsub/surveys \
#     --push-auth-service-account=ps-crm-pubsub@$PROJECT.iam.gserviceaccount.com

echo "Pub/Sub setup complete."