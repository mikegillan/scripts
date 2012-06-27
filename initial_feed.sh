#! /bin/sh

ENDPOINT="http://localhost:8181/cxf/FeedHandlerService"

curl --silent \
     --data \
     @- \
     --header 'Content-Type: application/soap+xml; charset=utf-8' \
     --user-agent "" \
     ${ENDPOINT} <<EOF | xmllint --format -
<?xml version="1.0" encoding="utf-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.feed.feed_handler.core.elm.n8id.com/">
  <soapenv:Header/>
  <soapenv:Body>
     <ser:runFeeds>
        <feedType>InitialFeed</feedType>
        <validateMode>false</validateMode>
     </ser:runFeeds>
  </soapenv:Body>
</soapenv:Envelope>
EOF
