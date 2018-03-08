#!/bin/bash -e

requirements_path=$(realpath "$1")
build_dir=$(realpath "$2")
python_version=3.6

mkdir --parents "$build_dir/virtualenv/"

virtualenv --python python$python_version "$build_dir/virtualenv/"
source "$build_dir/virtualenv/bin/activate"
pip install -r "$requirements_path"
