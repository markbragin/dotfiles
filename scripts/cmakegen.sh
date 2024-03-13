#!/bin/bash

resource_dir="$HOME/.local/share/cmakegen"


mkdir -p bin/debug bin/release build/debug build/release src include
cp -n "${resource_dir}/CMakeLists.txt" .
cp -n "${resource_dir}/main.cpp" src/

if [[ $1 ]]; then
    sed -i "s/CMAKE_CXX_STANDARD 20/CMAKE_CXX_STANDARD ${1}/" CMakeLists.txt
fi

cd build/debug; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=debug ../..
cd ../release; cmake -DCMAKE_BUILD_TYPE=release ../..
cd ../..
ln -s build/debug/compile_commands.json compile_commands.json
