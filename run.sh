#!/usr/bin/env bash

dune exec game_lang test.txt output.ll
llc -filetype=obj output.ll -o output.o
clang output.o -o output
./output
echo $?
