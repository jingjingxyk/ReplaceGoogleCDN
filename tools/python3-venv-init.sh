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

export PATH="$HOME/.local/bin:$PATH"
export PATH="${__PROJECT__}/runtime/node/bin/:$PATH"

mkdir -p ${__PROJECT__}/var/
cd ${__PROJECT__}/var/

pip3 install uv -i https://pypi.tuna.tsinghua.edu.cn/simple
uv --version

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
# uv pip install browser-use -i https://pypi.tuna.tsinghua.edu.cn/simple


:<<'EOF'
# python3 -m venv venv
# . venv/bin/activate

# python3 -m pip install uv -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install uv -i https://pypi.tuna.tsinghua.edu.cn/simple
uv venv --python 3.13
. .venv/bin/activate

python --version

cd ${__PROJECT__}/tools/

uv pip install mkdocs-material -i https://pypi.tuna.tsinghua.edu.cn/simple
uv pip install playwright -i https://pypi.tuna.tsinghua.edu.cn/simple
EOF

uv pip freeze >requirements.txt
