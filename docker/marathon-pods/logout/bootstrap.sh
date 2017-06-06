#!/usr/bin/env bash

set -ex

log_dir=$(dirname ${LOG_PATH})
if [[ ! -d "${log_dir}" ]]; then
  mkdir -p ${log_dir}
fi

while true; do
  date >> ${LOG_PATH}
  sleep 1
done
