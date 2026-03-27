# PSRM
FOR INDIA INNOVATES
https://ps-crm-7eb03.web.app



# Backend update
gcloud builds submit --tag asia-south1-docker.pkg.dev/project-06a3af2a-0437-48ad-802/pscrm/backend:v3 .
gcloud run deploy pscrm-backend --image asia-south1-docker.pkg.dev/project-06a3af2a-0437-48ad-802/pscrm/backend:v3 --region asia-south1

# Frontend update  
npm run build
firebase deploy --only hosting