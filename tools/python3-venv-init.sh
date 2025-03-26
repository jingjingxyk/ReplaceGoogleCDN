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
cd ${__PROJECT__}/var/

pip3 install uv -i https://pypi.tuna.tsinghua.edu.cn/simple
uv --version

export PATH="$HOME/.local/bin:$PATH"
export PATH="${__PROJECT__}/bin/runtime/node/bin/:$PATH"

cd ${__PROJECT__}/

# python3 -m venv venv
uv venv --python 3.13

source .venv/bin/activate

uv run python --version
python --version
python3 -V

#   查看python3 各版本
# ls -lha ~/.local/share/uv/python/

cd ${__PROJECT__}/tools/

export UV_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple

# uv add requests --index-url https://mirrors.aliyun.com/pypi/simple/

uv pip install mkdocs-material -i https://pypi.tuna.tsinghua.edu.cn/simple
uv pip install playwright -i https://pypi.tuna.tsinghua.edu.cn/simple
uv pip install browser-use -i https://pypi.tuna.tsinghua.edu.cn/simple
uv pip freeze >requirements.txt
