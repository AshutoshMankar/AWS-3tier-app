#!/bin/bash

# Get the directory of the script
script_dir=$(dirname "$0")

# Source the variables from variables.sh
source "${script_dir}/variables"

# Define the target file
backend_deployment_file="${script_dir}/k8s_manifests/backend-deployment.yaml"
# Use sed to replace text in the target file
sed -i "s/ALIAS_INFO/$ALIAS_INFO/g" "$backend_deployment_file"

frontend_deployment_file="${script_dir}/k8s_manifests/frontend-deployment.yaml"
# Use sed to replace text in the target file
sed -i "s/ALIAS_INFO/$ALIAS_INFO/g" "$frontend_deployment_file"
sed -i "s/DOMAIN/$DOMAIN/g" "$frontend_deployment_file"

full_stack_file="${script_dir}/k8s_manifests/full_stack_lb.yaml"
# Use sed to replace text in the target file
sed -i "s/DOMAIN/$DOMAIN/g" "$full_stack_file"


deploy_app_pipeline_file="${script_dir}/jenkins-pipelines/deploy-app.sh"
# Use sed to replace text in the target file
sed -i "s/ACCOUNT_ID/$ACCOUNT_ID/g" "$deploy_app_pipeline_file"


push_images_pipeline_file="${script_dir}/jenkins-pipelines/push-images-pipeline.sh"
# Use sed to replace text in the target file
sed -i "s/ALIAS_INFO/$ALIAS_INFO/g" "$push_images_pipeline_file"