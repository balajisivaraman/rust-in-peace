#!/bin/bash

set -e

OUTPUT_DIR=output
XELATEX_CMD="xelatex -output-directory=$OUTPUT_DIR --shell-escape rust-in-peace.tex"
BIBER_CMD="biber output/rust-in-peace"

function clean() {
    rm -rf $OUTPUT_DIR
    mkdir $OUTPUT_DIR
}

function build() {
    $XELATEX_CMD
    $BIBER_CMD
    $XELATEX_CMD
}

function main() {
    clean
    build
}

main
