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

The ALMA tunings deviated from nominal EHT tunings in several tracks:
 - e24b04 260G they had a deliberate offset of +500 MHz
 - e24c09 345G band2 had a HW BB Center of 337.547650 GHz instead of 337.541406250 GHz, breaking compatibility with the N*15.625 kHz sky-freq grid
 - e24f11 line observations have unexpected and unclear tunings cf. priors/alma/e24f11-linesurvey-script.log
   - apparently entirely non-EHT tunings of "HW BB Centers: [215591140500.0, 215091140500.0, 214088540000.0, 214385741000.0]"
   - additionally non-EHT sideband choices of "useUSB=[false,false,false,false]" instead of false,false,true,true

In e24c09 the ALMA 345G band2 data produced fringes with DiFX VEX and v2d settings of
```
$ehtc/alma-vex-defs.py -f 337547.656250 -w58.0 -s L -r alma    # 345G b2, nearest 15.625 kHz -aligned tuning, off from actual
v2d Aa loOffsets = -6250.0,-6250.0,...,-6250.0                 # corrective LO offset to reproduce the actual ALMA (mis)tuning
```

In e24f11 there are no ALMA fringes so far.

Firstly, ALMA had tunings that did not match the N*15.625 kHz sky-freq grid. This might perhaps be solved with DiFX VEX and v2d settings derived
for LOs of [215591140625.0, 215091140625.0, 214088546875.0, 214385734375.0] Hz paired with v2d LO offsets of [-125, -125, -6875, 6625] Hz.

Secondly, with the (initial logfile-based guess at...) ALMA e24f11 tunings the Mark6 'band1' modules probably
ended up with a shifted b2, 'band2' modules with a full b2, 'band3' modules with a mix of b2 and b1 (17 channels in b1 from ca 213.149 GHz to 214.087 GHz; no SiO lines),
and 'band4' modules likewise with a mix of b2 and b1 (12 channels in b1 from ca 213.446 GHz to 214.091 GHz; no SiO lines). Need to inspect e24f11-linesurvey-script.log
in more detail...


# TODO

Choose SPT coordinates for a mid-session day from ./priors/SPT.txt - then figure out revised coordinates by geodetic fitting?

Fix NOEMA VEX channel definitions: the 4 orphan channels of past expts are already getting re-routed to the correct Mark6s,
so can be correlated. Updated 345G b2 b3 so far. Need to check 230G 260G.


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
[] : did not observe this track
Aa : observed e24b04 offset by +500 MHz from rest of array,
     mutual freq coverage is reduced
     observed e24f11 with poor frequency grid choice
Ky : recorded b2 b3 (to be e-transferred), no data for b1 b4
```

Spectral line track e24f11/e24g11 in principle ought to cover
```
28SiO v=1, J=5-4, rest freq. 215.596 GHz, band 1 - primary line of interest
28SiO v=3, J=5-4, rest freq. 212.582 GHz, band 1 - other
29SiO v=1. J=5-4, rest freq. 212.905 GHz, band 1 - other
29SiO v=0, J=5-4, rest freq. 214.386 GHz, band 2 - other, perhaps strongest of the above three
```
and the track should be correlated at higher spectral resolution of v2d outputSpecRes=0.0625 MHz.


# Clock offsets

Clocks determined on the following scans

```
Track e24b04 (260G) - Aa as reference
095-0010 Aa-Gl Aa-Nn
095-0250 Aa-Mg
095-0314 Aa-Pv Aa-Ax
```

```
Track e24e07 - Aa as reference
098-0247 Aa-Nn
098-0353 Aa-Lm
098-0412 Aa-Gl Aa-Mg
098-1213 Aa-Sz Aa-Kt
098-1433 Aa-Lm-Ax-Mm-Sz
```

```
Track e24a08 - Aa as reference
099-0355 Aa-Gl Aa-Lm Aa-Mg Aa-Kt
099-0507 Aa-Mm Aa-Sz
099-0111 Aa-Nn
```

```
Track e24c09 (345G) - Aa as reference
100-0210 Aa-Pv
100-0236 Aa-Mg - the only Mg fringe in the track, faint
100-0840 Aa-Gl
100-0848 Aa-Ax Aa-Mm
```

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
