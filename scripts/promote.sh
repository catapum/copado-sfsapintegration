artifact_url="https://copado.jfrog.io/artifactory"
tag="4.0.3"
artifact_username="anmolk@copado.com"
profile="jfrog-releases"
# profile="mulesoft-releases"
artifact_password="g^IIgM3RXFxhT@*36yR6MyU5mp^eME"

version="$tag-SNAPSHOT"
mvn versions:set -DnewVersion="$version" -P "$profile"

mvn clean package deploy -e -Dartifact_url="$artifact_url" \
        -Dversion="$version" -Dartifact_username="$artifact_username" \
         -Dartifact_password="$artifact_password" -P "$profile"