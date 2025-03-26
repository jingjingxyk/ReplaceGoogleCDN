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

export PATH="$HOME/.local/bin:$PATH"
export PATH="${__PROJECT__}/bin/runtime/node/bin/:$PATH"

test -f .env || cp .env.example .env

source .venv/bin/activate

python3 -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"
python3 -E -c 'import sys ; from sysconfig import get_platform ; print("%s-%d.%d" % (get_platform(), *sys.version_info[:2])) ; '
# python3 -E -c 'import sys ; print(sys.modules) ; '
# python3 -E -c 'import sys ; print(dir(sys)) ; '

cd ${__PROJECT__}/

# uv run playwright install

uv run tools/run-test.py
