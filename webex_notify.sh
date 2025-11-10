#!/bin/bash


WEBEX_TOKEN="ZDk5OWIxZjgtOTVjOS00NTVmLWI0ZmMtMTUwZWRkZWJkYTBhYTkxZDY0MmQtMmMz_P0A1_13494cac-24b4-4f89-8247-193cc92a7636"

SPACE_ID="Y2lzY29zcGFyazovL3VybjpURUFNOnVzLXdlc3QtMl9yL1JPT00vYjMyZmVhZTAtYmI1ZC0xMWYwLWFmZDMtYWQ4ZjA2Zjc2Yjc3"


BUILD_STATUS="${BUILD_RESULT:-UNKNOWN}"
JOB_NAME="${JOB_NAME:-Unknown Job}"
BUILD_NUMBER="${BUILD_NUMBER:-0}"
GIT_COMMIT_SHA="${GIT_COMMIT_SHA:-N/A}"


MESSAGE="**[CI/CD Notification]** Job: ${JOB_NAME} #${BUILD_NUMBER}
Status: ${BUILD_STATUS}
Commit: ${GIT_COMMIT_SHA}"

echo "Attempting to send Webex notification for status: $BUILD_STATUS"


curl -X POST \
  -H "Authorization: Bearer ${WEBEX_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"roomId\": \"${SPACE_ID}\", \"markdown\": \"${MESSAGE}\"}" \
  https://api.webex.com/v1/messages


exit 0
