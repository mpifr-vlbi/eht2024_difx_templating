#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
OUTDIR=../templates/common_sections/

pushd $SCRIPT_DIR  2>&1 > /dev/null

# e24j25.vex:    year, doy: 2024, 025
# e24b04.vex:    year, doy: 2024,  94
# e24e07.vex:    year, doy: 2024,  98

./geteop.pl 2024-023  5 $OUTDIR/eop_e24j25.vex
./geteop.pl 2024-093  5 $OUTDIR/eop_e24b04.vex
./geteop.pl 2024-097  5 $OUTDIR/eop_e24e07.vex

./geteop.pl 2024-097  5 $OUTDIR/eop_e24a08.vex
./geteop.pl 2024-098  5 $OUTDIR/eop_e24c09.vex
./geteop.pl 2024-099  5 $OUTDIR/eop_e24d10.vex

popd  2>&1 > /dev/null

