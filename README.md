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

Track e24g11 is a combined track that repeats a missed part of track e24d10 (standard EHT 230G) on continuum sources,
and adds track e24f11 (standard EHT 230G, but different at ALMA) on spectral line sources.

The ALMA tunings deviated from nominal EHT tunings in several tracks:
 - e24b04 260G had a deliberate large offset of +500 MHz at ALMA
 - e24c09 345G band2 had a 'HW BB Center' of 337.547650 GHz instead of 337.541406250 GHz, breaking compatibility with the N*15.625 kHz sky-freq grid
 - e24f11 230G 'line observations' used VLBI mode for continuum sources, but for SiO targets used non-VLBI high-res mode for the bands 1/3/4 (i.e. no valid VLBI data)
 - e24f11 230G band2 data on SiO line sources was probably in VLBI mode and might have valid VLBI data. Actual tuning and the recorder holding the data still unclear.
 - The 2024 Draft Schedules page indicates 'Track F: SiO Masers at 215 GHz (Band-2 of the standard tuning for 221.1 GHz)' for which the ALMA script log
  ought to show a 'StandardVLBI HW BB Centers' with b2 of 21510000000.0 Hz, however, e24f11-linesurvey-script.log.gz shows a HW BB Center of 215091140500.0 Hz for b2.

In e24c09 the ALMA 345G band2 data produced fringes with DiFX VEX and v2d settings of
```
$ehtc/alma-vex-defs.py -f 337547.656250 -w58.0 -s L -r alma    # 345G b2, nearest 15.625 kHz -aligned tuning, off from actual
v2d Aa loOffsets = -6250.0,-6250.0,...,-6250.0                 # corrective LO offset to reproduce the actual ALMA (mis)tuning
```

In e24g11 there are ALMA b1 fringes on 3C279 using standard 230G EHT freq settings for ALMA.


# TODO

SPT coordinates from a mid-session day from ./priors/SPT.txt seem good enough, residual rate a big high, 100 milliHz,
but can be removed during fringe fitting. Full-track A-lists with ALMA-SPT fringes shared mid 2025 but no feedback received.

Track e24g11 (D+F) most likely needs to be split up for correlation;
part D as e24d11 with standard 230G settings in all bands, also at ALMA,
part F as e24f11 with band-specific settings of b1 high res 0.0625 MHz/ch, b2 which has ALMA but with LO offsets, b3 b4 without ALMA with standard 0.5 MHz/ch.

Channelization of Part F of track e24f11 needs to be checked: do the expected SiO lines land well in the middle of a 58 MHz outputband?


# Tracks

```
Track   Freq  HOPS  Stations
e24b04  260G  3841  Aa Ax Gl Mg Mm Nn Pv Sw [Lm Kt]
e24e07  230G  3842  Aa Ax Gl Kt Lm Mg Mm Nn Sw Sz [Pv]
e24a08  230G  3843  Aa Ax Gl Ky Kt Lm Mm Mg Nn Sw Sz [Pv]
e24c09  345G  3844  Aa Ax Gl Mg Mm Nn Pv Sw
e24d10  230G  3845  Ax Gl Kt Lm Mg Mm Pv Sw Sz [Aa Nn]
e24g11  230G  3846  Aa Gl Kt Lm Mg Mm Pv Sw Sz  aka e24f11 [Ax]

Notes
[] : did not observe this track
Aa : observed e24b04 offset by +500 MHz from rest of array,
     mutual freq coverage is reduced
     observed e24f11 with poor frequency grid choice
Ky : recorded b2 b3 (to be e-transferred), no data for b1 b4
```

Spectral line track e24f11/e24g11 ought to cover
```
28SiO v=1, J=5-4, rest freq. 215.596 GHz, band 1 - primary line of interest
28SiO v=3, J=5-4, rest freq. 212.582 GHz, band 1 - other
29SiO v=1. J=5-4, rest freq. 212.905 GHz, band 1 - other
29SiO v=0, J=5-4, rest freq. 214.386 GHz, band 2 - other, perhaps strongest of the above three
```
Band2 recordings are in Phased Array VLBI mode, others bands are non-VLBI Interferometer mode, discard in DiFX.
Band2 should be correlated in DiFX using a higher spectral resolution of v2d outputSpecRes=0.0625 MHz.


# Clock offsets

Clocks determined on the following scans

```
Track e24b04 (260G) - Aa as reference
095-0010 Aa-Gl Aa-Nn
095-0250 Aa-Mg
095-0314 Aa-Pv Aa-Ax
095-0731 Aa-Mm
```

```
Track e24e07 - Aa as reference
098-0247 Aa-Nn
098-0353 Aa-Lm
098-0412 Aa-Gl Aa-Mg
098-1213 Aa-Sz Aa-Kt
098-1433 Aa-Lm-Ax-Mm-Sz
Lm: needs clock break of -0.1 usec at 2024y098d05h00m00s
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
102-0758 Gl-Nn stronger fringe
```
