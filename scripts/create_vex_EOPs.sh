#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
OUTDIR=../templates/common_sections/

pushd $SCRIPT_DIR  2>&1 > /dev/null

# e24j25.vex:*    year, doy: 2024, 025

./geteop.pl 2024-023  5 $OUTDIR/eop_e24j25.vex

popd  2>&1 > /dev/null

