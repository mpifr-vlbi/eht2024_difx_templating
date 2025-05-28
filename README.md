# eht2024_difx_templating

# Correlation Environment

Use DiFX-2.9.1 - to be released 'soon', currently 2.9.0-a release candidate; May2025.
Possibly DiFX-2.9.2 if that will contain https://github.com/difx/difx/tree/feature-autozoom-improvements
which gets rid of 'unnecessary' small zooms caused by the edges of overlapped ALMA TFBs.

For correlator model use CALC 11 (difxcalc), not the old default CALC 9.1 (calcif2) model.
This is done via, e.g.,
```
$ calcifMixed --calc=difxcalc *.calc
$ startdifx --dont-calc *.input
```

Channel definitions are sorted in numerically increasing order in the DiFX v2d file to keep CASA data reduction happy.


# Notes on Stations

The SMT 345G receiver is not sideband reparating; LSB folds onto USB (b2+b3, b1+b4).

In e24b04 ALMA had a deliberate offset of +500 MHz away from nominal EHT 260G tunings. Fringes Nn-Pv, Aa-Ax, Aa-Mg.

In e24f11 ALMA line observations the ALMA tunings were "HW BB Centers: [215591140500.0, 215091140500.0, 214088540000.0, 214385741000.0]".
These do not adhere to the 15625 Hz granularity of the PFBs (and of the ALMA EHT tunings) hence the DiFX frequency grids of EHT vs ALMA
do not align. To re-align with EHT, must derive VEX freqs from rounded LOs of [215591140625.0, 215091140625.0, 214088546875.0, 214385734375.0] Hz
with LO offsets to be used in v2d files of [-125, -125, -6875, 6625] Hz.


# TODO

Choose SPT coordinates for a mid-session day from ./priors/SPT.txt

In 260G e24b04, should add addOutputBand's to fill 250500--251060 MHz which other stations observed,
and which are lost at ALMA due to their 500 MHz offset.


# Tracks

```
Track   Freq  HOPS  Stations
e24b04  260G  3841  Aa Ax Gl Mg Mm Nn Pv Sw - scheduled but not obs at Lm Kt
e24e07  230G  3842  Aa Ax Gl Kt Lm Mg Mm Nn Pv Sw Sz
e24a08  230G  3843  Aa Ax Gl Ky Kt Lm Mm Mg Nn Pv Sw Sz
e24c09  345G  3844  Aa Ax Gl Mg Mm Nn Pv Sw
e24d10  230G  3845  Aa Ax Gl Kt Lm Mg Mm Nn Pv Sw Sz
e24f11  230G  3846  Aa Ax Gl Kt Lm Mg Mm Bb Pv Sw Sz  aka e24g11

Notes
Aa : observed e24b04 offset by +500 MHz from rest of array,
     mutual freq coverage is reduced
     observed e24f11 with poor frequency grid choice
Ky : recorded b2 b3 (to be e-transferred), no data for b1 b4
```
