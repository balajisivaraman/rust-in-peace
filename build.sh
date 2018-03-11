#!/bin/bash

set -e

SHOULD_CLEAN=${1:-0}

OUTPUT_DIR=output
MINTED_DIR=_minted-rust-in-peace
XELATEX_CMD="xelatex -output-directory=$OUTPUT_DIR --shell-escape rust-in-peace.tex"
BIBER_CMD="biber output/rust-in-peace"

function clean() {
    rm -rf $OUTPUT_DIR $MINTED_DIR
    mkdir $OUTPUT_DIR
}

function build() {
    $XELATEX_CMD
    $BIBER_CMD
    $XELATEX_CMD
}

function main() {
    if [ "$SHOULD_CLEAN" -eq "1" ]; then
       clean
    fi
    build
}

main
