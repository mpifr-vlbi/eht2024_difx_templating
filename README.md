# eht2024_difx_templating

# Correlation Environment

Use DiFX-2.9.1 - to be released 'soon', currently 2.9.0-a release candidate; May2025.
Possibly DiFX-2.9.2 if that will contain https://github.com/difx/difx/tree/feature-autozoom-improvements
which gets rid of 'unnecessary' small zooms caused by the edges of overlapped ALMA TFBs.

As the correlator model use CALC 11 (difxcalc), not the old default CALC 9.1 (calcif2) model.
This is done via, e.g.,
```
$ calcifMixed --calc=difxcalc *.calc
$ startdifx --dont-calc *.input
```

Channel definitions are sorted in numerically increasing order in the DiFX v2d file to keep CASA data reduction happy.


# Notes on Stations

The SMT 345G receiver is not sideband reparating; LSB folds onto USB (b2+b3, b1+b4). Weather there was poor, though, and only one scan has a fringe.

In e24b04 ALMA had a deliberate offset of +500 MHz away from nominal EHT 260G tunings. Fringes Nn-Pv, Aa-Ax, Aa-Mg.

In e24f11 ALMA line observations the ALMA tunings were "HW BB Centers: [215591140500.0, 215091140500.0, 214088540000.0, 214385741000.0]".
These do not adhere to the 15625 Hz granularity of the PFBs (and of the ALMA EHT tunings) hence the DiFX frequency grids of EHT vs ALMA
do not align. To re-align with EHT, must derive VEX freqs from rounded LOs of [215591140625.0, 215091140625.0, 214088546875.0, 214385734375.0] Hz
with LO offsets to be used in v2d files of [-125, -125, -6875, 6625] Hz.


# TODO

Choose SPT coordinates for a mid-session day from ./priors/SPT.txt - then figure out revised coordinates by geodetic fitting?

In 260G e24b04, use addOutputBand's to fill 250500--251060 MHz which other stations observed,
and which are lost at ALMA due to their 500 MHz offset.


# Tracks

```
Track   Freq  HOPS  Stations
e24b04  260G  3841  Aa Ax Gl Mg Mm Nn Pv Sw [Lm Kt]
e24e07  230G  3842  Aa Ax Gl Kt Lm Mg Mm Nn Sw Sz [Pv]
e24a08  230G  3843  Aa Ax Gl Ky Kt Lm Mm Mg Nn Sw Sz [Pv]
e24c09  345G  3844  Aa Ax Gl Mg Mm Nn Pv Sw
e24d10  230G  3845  Ax Gl Kt Lm Mg Mm Pv Sw Sz [Aa Nn]
e24f11  230G  3846  Aa Gl Kt Lm Mg Mm Pv Sw Sz  aka e24g11 [Ax]

Notes
Aa : observed e24b04 offset by +500 MHz from rest of array,
     mutual freq coverage is reduced
     observed e24f11 with poor frequency grid choice
Ky : recorded b2 b3 (to be e-transferred), no data for b1 b4
```

# Clock offsets

Clocks determined on the following scans

```
Track e24d10 - Kt as reference
101-0144 Pv-Kt
101-0436 Kt-Lm Kt-Gl Ax-Lm
101-0652 Kt-Mm Kt-Sz Ax-Lm Kt-Ax Kt-Lm
101-0803 Kt-Mg
```

```
Track e24g11[/f11/d11] - Kt as reference
101-2255 Nn-Pv
101-2313 Gl-Nn
102-0129 Gl-Mg
102-0224 Kt-Mg
102-0643 Kt-Mm Kt-Sz
```
