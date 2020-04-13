#DU_LIST=$(docker run registry.unx.sas.com/docker-test/service-du-dependencies:0.0.2-20191105.1572981483 embscoresvc)
DU_LIST="arke,authorizatn,dkrconsul,dkrrabbitmq,dkrsdatasvr,embscoresvc,logon,cachelocator,cacheserver,identities,configuratn,credentials"
TARGET_WORKSPACE=/workspace
INGRESS_HOST="$1.$HOSTNAME"
echo ${DU_LIST}
echo $INGRESS_HOST
mkdir -p /c/MAS
docker run \
    --rm \
    -v /c/MAS:${TARGET_WORKSPACE} \
    -e DU_LIST="${DU_LIST}" \
    -e K8S_INGRESS_HOST=${INGRESS_HOST} \
    -e K8S_NAMESPACE="$1" \
    -e SAS_ORDER="$2" \
    -e WORKSPACE="${TARGET_WORKSPACE}" \
    --name "mas_generatemanifest" \
    registry.unx.sas.com/docker-test/generate-viya-manifest:0.0.6-20191112.1573570755

