#!/bin/bash

# 1. Define variables (Using your provided token and confirmed ID)
WEBEX_TOKEN="OWRkY2MyYTItZjc3ZS00MmFiLWI0OWItOTRlOTQzYTVmYWYxNGQ0NTc4MjctNGRh_P0A1_13494cac-24b4-4f89-8247-193cc92a7636"
# Using the confirmed UUID format for the Space ID
SPACE_ID="d0c54540-ba73-11f0-a71a-b7d267395f5d"

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
# The token is passed in the Authorization header.
curl -X POST \
  -H "Authorization: Bearer ${WEBEX_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"roomId\": \"${SPACE_ID}\", \"markdown\": \"${MESSAGE}\"}" \
  https://api.webex.com/v1/messages

# Exit successfully so the Post-build action doesn't fail the job itself.
exit 0
