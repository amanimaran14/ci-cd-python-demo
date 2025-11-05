#!/bin/bash

# This script is executed by Jenkins after the build completes.

# 1. Define variables (IMPORTANT: Replace placeholders with your actual values!)
WEBEX_TOKEN=MDk2M2VjNjEtZjE3NS00OTE0LWE1YWEtYzQ3NjBkYWZlYWM2ZTZiNTIwZmMtZmIy_P0A1_13494cac-24b4-4f89-8247-193cc92a7636
SPACE_ID=aHR0cHM6Ly9jb252LXIud2J4Mi5jb20vY29udmVyc2F0aW9uL2FwaS92MS9jb252ZXJzYXRpb25zL2QwYzU0NTQwLWJhNzMtMTFmMC1hNzFhLWI3ZDI2NzM5NWY1ZA==

# Jenkins environment variables are used here
BUILD_STATUS="${BUILD_RESULT:-UNKNOWN}"
JOB_NAME="${JOB_NAME:-Unknown Job}"
BUILD_NUMBER="${BUILD_NUMBER:-0}"
GIT_COMMIT_SHA="${GIT_COMMIT_SHA:-N/A}"

# 2. Construct the message content using Markdown
MESSAGE="**[CI/CD Notification]** Job: ${JOB_NAME} #${BUILD_NUMBER}
         Status: ${BUILD_STATUS}
         Commit: ${GIT_COMMIT_SHA}"

echo "Attempting to send Webex notification for status: $BUILD_STATUS"

# 3. Use curl to send the JSON payload to the Webex API
curl -X POST \
  -H "Authorization: Bearer ${WEBEX_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"roomId\": \"${SPACE_ID}\", \"markdown\": \"${MESSAGE}\"}" \
  https://api.webex.com/v1/messages

# NOTE: It's good practice to exit successfully here so the Post-build action doesn't fail the job itself.
exit 0
