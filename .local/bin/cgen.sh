#!/bin/bash

resource_dir="$HOME/.local/share/cgen"

mkdir -p bin/debug bin/release build/debug build/release src include
cp -n "${resource_dir}/CMakeLists.txt" .
cp -n "${resource_dir}/main.c" src/

cd build/debug; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=debug ../..
cd ../release; cmake -DCMAKE_BUILD_TYPE=release ../..
cd ../..
ln -s build/debug/compile_commands.json compile_commands.json
