#!/usr/bin/env bash

export DATE=$(date '+%Y-%m-%d')

while read LIST ; do

# docker run --rm -e TRIVY_USERNAME=user_name -e TRIVY_PASSWORD=user_passwd aquasec/trivy --timeout 60m image --scanners vuln --severity HIGH,CRITICAL $LIST
# docker run --rm  aquasec/trivy -q image --scanners vuln --severity HIGH,CRITICAL $LIST
# docker run --rm -e TRIVY_USERNAME=user_name -e TRIVY_PASSWORD=user_passwd --mount src="$(pwd)/trivycache",target=/root/trivycache,type=bind aquasec/trivy --timeout 60m --cache-dir /root/trivycache/ image --scanners vuln --severity HIGH,CRITICAL --no-progress $LIST

#trivy \
#  --cache-dir trivycache/ \
#  --quiet \
#  image \
#  --format=template --template='@html.tpl' \
#  --severity HIGH,CRITICAL \
#  --timeout 60m \
#  --scanners vuln \
#  --no-progress \
#  $LIST
#done < ./$1 > vulnerabilities.report.html


trivy \
  --cache-dir trivycache/ \
  image \
  --severity HIGH,CRITICAL \
  --timeout 60m \
  --scanners vuln \
  --no-progress \
  --ignore-unfixed \
  $LIST

done < ./$1 > vulnerabilities.report.txt
