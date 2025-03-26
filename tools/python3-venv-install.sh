#!/usr/bin/env bash

set -exu
__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)

__PROJECT__=$(
  cd ${__DIR__}/../
  pwd
)

mkdir -p ${__PROJECT__}/var/
cd ${__PROJECT__}/

source .venv/bin/activate

cd ${__PROJECT__}/tools/

uv pip install --upgrade -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
