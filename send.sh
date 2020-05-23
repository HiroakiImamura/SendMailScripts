#!/bin/bash

KEY="$1"
TO="$2"
FROM="$3"
SUBJECT="$4"
VAL="$5"

#echo $KEY
#echo $TO
#echo $FROM
#echo $SUBJECT
#echo $VAL

# 送信
curl -s -X POST https://api.sendgrid.com/v3/mail/send \
        -H "Authorization: Bearer $KEY" \
        -H "Content-Type: application/json" \
        -d @- <<EOF
{
  "personalizations":
    [{"to": [{"email": "${TO}"}]}],
    "from": {"email": "${FROM}"},
    "subject": "${SUBJECT}",
    "content": [{"type": "text/html","value": "${VAL}"}]
}
EOF
