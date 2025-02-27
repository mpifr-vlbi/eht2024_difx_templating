# eht2024_difx_templating

# Correlation Environment

Use DiFX-2.8.1 or DiFX-2.7.1. Apply a small local patch `./patches/difx-271-jobsplit-patch.svndiff`
or `./patches/difx-281-jobsplit-patch.svndiff`. The patch fixes a shortcoming in DiFX job
creation for sub-arrayed tracks (tbd: which in 2024?) where certain simultaneously observed
scans get split unnecessarily into 2-3 correlation jobs per scan. While fine for FITS-IDI,
Mk4 takes only the 1st data part of split scans. The patch avoids creating scan splits.
See https://github.com/difx/difx/pull/67/

Use CALC 11 rather than the old default CALC 9.1 model by, e.g.,
```
$ calcifMixed --calc=difxcalc *.calc
$ startdifx --dont-calc *.input
```

Channel definitions are sorted in numerically increasing order in the DiFX v2d file to keep CASA data reduction happy.


# Notes on Stations

The SMT 345G receiver is not sideband reparating; LSB folds onto USB (b2+b3, b1+b4).

In e24b04 ALMA observed offset by +500 MHz from nominal EHT 260G tuning.


# TODO

In the 260G track, fringes NN-PV and AA-AX so far, todo other stations.

Also in the 260G track, add addOutputBand's to fill 250500--251060 MHz which other stations observed but not ALMA.

Choose SPT coordinates for a mid-session day from ./priors/SPT.txt


# Tracks

```
Track   Freq  HOPS  Stations
e24b04  260G  tbd   Aa Ax Gl Mg Mm Nn Pv Sw - scheduled but not obs at Lm Kt
e24e07  230G  tbd   Aa Ax Gl Kt Lm Mg Mm Nn Pv Sw Sz
e24a08  230G  tbd   Aa Ax Gl Ky Kt Lm Mm Mg Nn Pv Sw Sz
e24c09  345G  tbd   Aa Ax Gl Mg Mm Nn Pv Sw
e24d10  230G  tbd   Aa Ax Gl Kt Lm Mg Mm Nn Pv Sw Sz

Notes
Aa : observed e24b04 offset by +500 MHz from rest of array,
     mutual freq coverage is reduced
Ky : recorded b2 b3 (to be e-transferred), no data for b1 b4
```
