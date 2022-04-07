runtime_version="4.3.0"
client_id="285668e9de9c4f39a74b01fdb1b6dc58"
client_secret="3aCc7323CA284b548F0F7ea37D56234b"
app_name="AnmolApp123"
environment_name="Staging"
worker_count="1"
worker_type="MICRO"
region="us-east-1"
profile="jfrog-releases"
tag="4.0.3"

# mvn deploy -DmuleDeploy -e -Dclientid="$client_id" -Dclientsecret="$client_secret" \
#     -Dappname="$app_name" -Denvironment="$environment_name" -DworkerCount="$worker_count" \
#     -DworkerType="$worker_type" -Druntime_version="$runtime_version" -Dregion="$region" -P "$profile"


# mvn deploy -DmuleDeploy -e -Dclientid="285668e9de9c4f39a74b01fdb1b6dc58" -Dclientsecret="3aCc7323CA284b548F0F7ea37D56234b" \
#     -Dappname="AnmolApp123" -Denvironment="Staging" -DworkerCount="1" \
#     -DworkerType="MICRO" -Druntime_version="4.3.0" -Dregion="us-east-1" -P "mulesoft-releases"

# mvn deploy:deploy-file -Dfile=/Users/anmolkumar/Desktop/MuleTest/target2/muledeploy-1.0.0-SNAPSHOT-mule-application.jar -P "$profile" -s ./scripts/settings.xml

version="$tag-SNAPSHOT"
echo "downloading from jfrog..."
mvn dependency:get -Ddest=./muledeploy.jar -DgroupId=com.mycompany -DartifactId=muledeploy -Dversion="$version" -Dclassifier=mule-application \
-s scripts/settings.xml -P "$profile"

echo "Installing in mule..."
mvn mule:deploy -Dmule.artifact="./muledeploy.jar" -Dclientid="285668e9de9c4f39a74b01fdb1b6dc58" \
    -Dclientsecret="3aCc7323CA284b548F0F7ea37D56234b" \
    -Dappname="AnmolApp123" -Denvironment="Staging" -DworkerCount="1" \
    -DworkerType="MICRO" -Druntime_version="4.3.0" -Dregion="us-east-1" -P "mulesoft-releases"