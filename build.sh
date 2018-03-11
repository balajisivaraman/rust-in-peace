#!/bin/bash

set -e

SHOULD_GENERATE_BIB=${1:-0}
SHOULD_CLEAN=${2:-0}

OUTPUT_DIR=output
XELATEX_CMD="xelatex -output-directory=$OUTPUT_DIR --shell-escape rust-in-peace.tex"
BIBER_CMD="biber output/rust-in-peace"

function clean() {
    rm -rf $OUTPUT_DIR
    mkdir $OUTPUT_DIR
}

function build() {
    $XELATEX_CMD
    if [ "$SHOULD_GENERATE_BIB" -eq "1" ]; then
        $BIBER_CMD
        $XELATEX_CMD
    fi
}

function main() {
    if [ "$SHOULD_CLEAN" -eq "1" ]; then
        clean
    fi
    build
}

main
