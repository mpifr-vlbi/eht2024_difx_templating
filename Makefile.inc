# Which tracks to generate
TRACKS_230G := e24j25 e24e07 e24a08 e24d10 e24g11
TRACKS_260G := e24b04
TRACKS_345G := e24c09

# Revision of correlation run, e.g., v1a, gold253, gold261, gold262
#REV  := v1
REV := FRINGE

# Release version, e.g., 1 as in e22d23-1-b1
REL  := 0

# Name of site; used for ./filelists_<SITE>/
SITE := mpifr

# Top-level directory for Correlator output, any experiment
# The generated files <trackname>-$REL-{b1,b2,b3,b4}.{v2d,vex.obs}
# will be placed under directories $EXPROOT/<trackname>/$REV/<band>/
EXPROOT := /Exps/
