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

export PATH=${__PROJECT__}/bin/runtime/node/bin:$PATH

while [ $# -gt 0 ]; do
  case "$1" in
  --init)
    npm install pnpm puppeteer-core prettier web-ext --save-dev --registry=https://registry.npmmirror.com
    ;;
  --install)
    npx pnpm install --registry=https://registry.npmmirror.com
    ;;
  --update)
    npx npm-check-updates -u
    ;;
  --fund)
    npm fund
    ;;
  *) ;;
  esac
  shift $(($# > 0 ? 1 : 0))
done
