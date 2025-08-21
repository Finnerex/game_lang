#!/usr/bin/env bash

project_path=test_project

dune exec game_lang "$project_path/test.st" "$project_path/bin/output.ll" &&
llc -filetype=obj "$project_path/bin/output.ll" -o "$project_path/bin/output.o" &&
clang "$project_path/bin/output.o" -o "$project_path/bin/output" &&
./$project_path/bin/output &&
echo $?
