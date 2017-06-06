#!/usr/bin/env bash

set -ex

echo "Removing XPACK config in default config ..."
sed -i '/xpack/d' ${LOGSTASH_ROOT_PATH}/config/logstash.yml

cat > ${LOGSTASH_CONFIG_PATH} << EOF
input {
  file {
    type => test_log
    path => "${LOG_PATH}"
  }
}

output {
  stdout {
    codec => rubydebug
  }
}
EOF

#DOWNLOAD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#[[ $START_SCRIPT == http* ]] && \
#  curl -s $START_SCRIPT > ${DOWNLOAD_DIR}/start_script && \
#  START_SCRIPT="${DOWNLOAD_DIR}/start_script" && \
#  chmod +x $START_SCRIPT
#
#if [[ -n "$START_SCRIPT" ]]; then
#  echo "Running start script: ${START_SCRIPT}"
#  $START_SCRIPT
#fi

gosu logstash ${LOGSTASH_ENTRYPOINT} -f ${LOGSTASH_CONFIG_PATH}
