#!/bin/bash
#
# Split sections of the VEX files under ../observed_vex/ into different files.
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
VEXDIR=../observed_vex/
OUTDIR=../templates/common_sections/

pushd $SCRIPT_DIR  2>&1  > /dev/null

function extract_vex_sections() {

	vexname=`basename $1`

	# Get all of SCHED block until end of file
	sed -n "/\$SCHED;/,/^<eof>/p" $1 > $OUTDIR/sched_$vexname

	# Rename the NoXXXX scans into doy-hhmm
	tmpfile=$(mktemp /tmp/extract_vex_portions.XXXXXX)
	awk -f scanmod.awk $OUTDIR/sched_$vexname > $tmpfile
	mv $tmpfile $OUTDIR/sched_$vexname

	# Get all of SOURCE block until FREQ block
	sed -n "/\$SOURCE;/,/\$FREQ;/p" $1 > $OUTDIR/sources_$vexname
	sed -i '$ d' $OUTDIR/sources_$vexname  # remove trailing $FREQ; line
}

for vexfile in `ls -1 $VEXDIR/*.vex`; do
	echo "Running extract_vex_sections $vexfile"
	extract_vex_sections $vexfile
done

popd   2>&1  > /dev/null
