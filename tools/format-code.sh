#!/usr/bin/env bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}

__PROJECT__=$(readlink -f ${__DIR__}/../)

cd ${__PROJECT__}

if [[ ! -f ${__PROJECT__}/bin/runtime/node/bin/node ]]; then
  bash tools/setup-nodejs-runtime.sh --mirror china
fi

npx prettier --write .

cd ${__DIR__}
