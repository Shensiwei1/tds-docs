rm -f ../build
SOURCE_VERSION_SHORT="$(git rev-parse --short HEAD)"
echo $SOURCE_VERSION_SHORT
ARTIFACT_IMAGE="taptap-img-registry-vpc.cn-beijing.cr.aliyuncs.com/tds/tapsdkdoc:${SOURCE_VERSION_SHORT}"
yarn build
docker build -t $ARTIFACT_IMAGE . 
docker push $ARTIFACT_IMAGE