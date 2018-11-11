# Create build certs
BUILD_USER_HOME="~/"
BUILD_USER="$(whoami)"

mkdir "${BUILD_USER_HOME}"/certificates
openssl genrsa -out "${BUILD_USER_HOME}"/certificates/prod-cakey.pem 2048
openssl genrsa -out "${BUILD_USER_HOME}"/certificates/dev-cakey.pem 2048
openssl req -new -x509 -key "${BUILD_USER_HOME}"/certificates/prod-cakey.pem \
    -out "${BUILD_USER_HOME}"/certificates/prod-cacert.pem -days 1095 \
    -subj "/C=US/ST=Massachusetts/L=Boston/O=OpenXT/OU=OpenXT/CN=openxt.org"
openssl req -new -x509 -key "${BUILD_USER_HOME}"/certificates/dev-cakey.pem \
    -out "${BUILD_USER_HOME}"/certificates/dev-cacert.pem -days 1095 \
    -subj "/C=US/ST=Massachusetts/L=Boston/O=OpenXT/OU=OpenXT/CN=openxt.org"
chown -R ${BUILD_USER}:${BUILD_USER} "${BUILD_USER_HOME}"/certificates
