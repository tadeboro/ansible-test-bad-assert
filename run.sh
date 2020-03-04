#!/bin/bash

set -euo pipefail

rm -rf venv
virtualenv -p ${1:-python3} venv
. venv/bin/activate
pip install ansible

PY=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

ansible-test units --requirements --python $PY tests/unit/test_x.py || true
pytest tests/unit/test_x.py
