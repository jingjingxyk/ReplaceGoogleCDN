#!/usr/bin/env bash

set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}

__PROJECT__=$(readlink -f ${__DIR__}/../)

cd ${__PROJECT__}

export PATH=${__PROJECT__}/bin/runtime/node/bin:$PATH

if [[ ! -f ${__PROJECT__}/bin/runtime/node/bin/node ]]; then
  bash tools/setup-nodejs-runtime.sh --mirror china
  npm install --registry=https://registry.npmmirror.com
  chmod a+x ${__PROJECT__}/node_modules/.bin/prettier
fi

npx prettier --write .

cd ${__DIR__}
