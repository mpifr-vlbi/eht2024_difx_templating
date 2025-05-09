
## Get global settings; TRACKS_230G TRACKS_345G (e24...,) REV (FRINGE, v0), REL (0), SITE (mpifr), EXPROOT (/Exps)
include Makefile.inc

## Derived set of v2d,vex for DiFX outputbands correlation
DIFX_TARGETS_230G := $(addsuffix _b1_230,$(TRACKS_230G)) $(addsuffix _b2_230,$(TRACKS_230G)) $(addsuffix _b3_230,$(TRACKS_230G)) $(addsuffix _b4_230,$(TRACKS_230G))
DIFX_TARGETS_260G := $(addsuffix _b1_260,$(TRACKS_260G)) $(addsuffix _b2_260,$(TRACKS_260G)) $(addsuffix _b3_260,$(TRACKS_260G)) $(addsuffix _b4_260,$(TRACKS_260G))
DIFX_TARGETS_345G := $(addsuffix _b1_345,$(TRACKS_345G)) $(addsuffix _b2_345,$(TRACKS_345G)) $(addsuffix _b3_345,$(TRACKS_345G)) $(addsuffix _b4_345,$(TRACKS_345G))
DIFX_TARGETS_ALL := $(DIFX_TARGETS_230G) $(DIFX_TARGETS_260G) $(DIFX_TARGETS_345G)
TRACKS_ALL := $(TRACKS_230G) $(TRACKS_260G) $(TRACKS_345G)

# .NOTPARALLEL:  # note: quite slow build, commented out again; but be careful to do 'make all' and then 'make install' as separate steps, not 'make all install'

default: all

b1: $(addsuffix _b1_230,$(TRACKS_230G)) $(addsuffix _b1_260,$(TRACKS_260G)) $(addsuffix _b1_345,$(TRACKS_345G))
b2: $(addsuffix _b2_230,$(TRACKS_230G)) $(addsuffix _b2_260,$(TRACKS_260G)) $(addsuffix _b2_345,$(TRACKS_345G))
b3: $(addsuffix _b3_230,$(TRACKS_230G)) $(addsuffix _b3_260,$(TRACKS_260G)) $(addsuffix _b3_345,$(TRACKS_345G))
b4: $(addsuffix _b4_230,$(TRACKS_230G)) $(addsuffix _b4_260,$(TRACKS_260G)) $(addsuffix _b4_345,$(TRACKS_345G))

hey:
	## NOEMA Array Reference Positions
	for exptname in $(TRACKS_ALL); do \
		./scripts/vlbimonitordb/vlbimon-get-noemaPosition.py $${exptname} > ./templates/common_sections/sites_NOEMA_$${exptname}.vex ; \
	done

## Target 'prerequisites' for the first run only:
##  - split observed VEX into shared file fragments common to all bands and setups
##  - produce common EOP for all bands and setups
##  - create blank clock files (later refined/overwritten by actual results from manual fringe searches)
##  - create initial clock files for SMA from their spreadsheet data files for each day
##  - create NOEMA phase ref $SITE coordinates for each track (to avoid shadowing they often switch ref antenna on different days)
##  - create standard ALMA and NOEMA freq setup VEX chan_def's
prerequisites:
	mkdir -p out
	. scripts/extract_vex_portions.sh
	. scripts/create_vex_EOPs.sh
	. scripts/make_initial_clocks.sh
	. scripts/make_initial_notes.sh
	## Recorded Mark6 file lists
	make -C filelists bonn
	make -C filelists hays
	make -C filelists install
	## NOEMA Array Reference Positions
	for exptname in $(TRACKS_ALL); do \
		./scripts/vlbimonitordb/vlbimon-get-noemaPosition.py $${exptname} > ./templates/common_sections/sites_NOEMA_$${exptname}.vex ; \
	done
	# ./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 1,2 > templates/230G/band2/freqs_NOEMA.vex # commented out after decision 5/2021 to ignore the 4x64 MHz overlap of b2 into recorder1
	# ./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 3,4 > templates/230G/band3/freqs_NOEMA.vex
	## 230G
	./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 1   > templates/230G/band1/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 2   > templates/230G/band2/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 4   > templates/230G/band3/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 221.100 --lo2 7.744 -r 3   > templates/230G/band4/freqs_NOEMA.vex
	./scripts/alma-vex-defs.py --lo1 221.100 -r 1 > templates/230G/band1/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 221.100 -r 2 > templates/230G/band2/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 221.100 -r 3 > templates/230G/band3/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 221.100 -r 4 > templates/230G/band4/freqs_ALMA.vex
	## 260G
	# NOEMA
	./scripts/noema-vex-defs.py --lo1 259.500 --lo2 7.744 -r 1   > templates/260G/band1/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 259.500 --lo2 7.744 -r 2   > templates/260G/band2/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 259.500 --lo2 7.744 -r 4   > templates/260G/band3/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py --lo1 259.500 --lo2 7.744 -r 3   > templates/260G/band4/freqs_NOEMA.vex
	# ALMA - no fringes with a priori tuning info of
	# ./scripts/alma-vex-defs.py --lo1 259.500 -r 1 > templates/260G/band1/freqs_ALMA.vex
	# ./scripts/alma-vex-defs.py --lo1 259.500 -r 2 > templates/260G/band2/freqs_ALMA.vex
	# ./scripts/alma-vex-defs.py --lo1 259.500 -r 3 > templates/260G/band3/freqs_ALMA.vex
	# ./scripts/alma-vex-defs.py --lo1 259.500 -r 4 > templates/260G/band4/freqs_ALMA.vex
	# ALMA - try with actual settings from e24b04 execlog received Feb 2025
	#    2024-04-04T07:41:07.484 StandardVLBI HW BB Centers: [252000000000.0, 254000000000.0, 266000000000.0, 268000000000.0]"
	# $ehtc/alma-vex-defs.py -f252000.00000 -w58.0 -sL -ralma # b1
	# $ehtc/alma-vex-defs.py -f254000.00000 -w58.0 -sL -ralma # b2
	# $ehtc/alma-vex-defs.py -f266000.00000 -w58.0 -sU -ralma # b3
	# $ehtc/alma-vex-defs.py -f268000.00000 -w58.0 -sU -ralma # b4
	# equiv to more readily copy-pasteable
	./scripts/alma-vex-defs.py --lo1 260.000 -r 1 > templates/260G/band1/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 260.000 -r 2 > templates/260G/band2/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 260.000 -r 3 > templates/260G/band3/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 260.000 -r 4 > templates/260G/band4/freqs_ALMA.vex
	#
	## 345G
	# NOEMA
	./scripts/noema-vex-defs.py -c "4-8" --lo1 342.600 --lo2 7.744 -r 1   > templates/345G/band1/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py -c "4-8" --lo1 342.600 --lo2 7.744 -r 2   > templates/345G/band2/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py -c "4-8" --lo1 342.600 --lo2 7.744 -r 4   > templates/345G/band3/freqs_NOEMA.vex
	./scripts/noema-vex-defs.py -c "4-8" --lo1 342.600 --lo2 7.744 -r 3   > templates/345G/band4/freqs_NOEMA.vex
	# ALMA : same as EHT 2021 except now exact tuning (0 LO offset), vs EHT 2023 where tunings were coarsely shifted to avoid LO offset
	./scripts/alma-vex-defs.py --lo1 343.600      -r 1 > templates/345G/band1/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 343.54140625 -r 2 > templates/345G/band2/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 341.600      -r 3 > templates/345G/band3/freqs_ALMA.vex
	./scripts/alma-vex-defs.py --lo1 341.600      -r 4 > templates/345G/band4/freqs_ALMA.vex
	# equivalent to the not so copy-pasteable output of
	# $ehtc/alma-vex-defs.py -f335600.00000 -w58.0 -sL -ralma # b1 alt
	# $ehtc/alma-vex-defs.py -f337541.40625 -w58.0 -sL -ralma # b2, shifted 58.59375 MHz
	# $ehtc/alma-vex-defs.py -f347600.00000 -w58.0 -sU -ralma # b3
	# $ehtc/alma-vex-defs.py -f349600.00000 -w58.0 -sU -ralma # b4
	#
	## 230G ALMA in Spectral Line track e24g11(/f11/d11)
	#
	# Logfile indicates all VLBI scans used these LO settings
	#   StandardVLBI HW FS[BB_1] useUSB:false 12GHz:false sbPrf:LSB CFreq: 215591140500.0 (HW)
	#   StandardVLBI HW FS[BB_2] useUSB:false 12GHz:false sbPrf:LSB CFreq: 215091140500.0 (HW)
	#   StandardVLBI HW FS[BB_3] useUSB:false 12GHz:true sbPrf:LSB CFreq: 214088540000.0 (HW)
	#   StandardVLBI HW FS[BB_4] useUSB:false 12GHz:false sbPrf:LSB CFreq: 214385741000.0 (HW)
	#   StandardVLBI HW BB Centers: [215591140500.0, 215091140500.0, 214088540000.0, 214385741000.0]
	#   -> useUSB=[false,false,false,false]   while continuum e23c16 had useUSB=[false,false,true,true]
	#   ->  12ghz=[false,false,true,false]    while continuum e23c16 had  12ghz=[true,false,false,true]
	# so *probably* goes like this
	#$ehtc/alma-vex-defs.py -f215591.140500 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f215091.140500 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f214088.540000 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f214385.741000 -w58.0 -sL -ralma
	# with +8000 MHz becomes
	#./scripts/alma-vex-defs.py --lo1 223.591140500 -r 1 > templates/230G/band1/freqs_ALMA_e24g11.vex
	#./scripts/alma-vex-defs.py --lo1 223.091140500 -r 1 > templates/230G/band2/freqs_ALMA_e24g11.vex
	#./scripts/alma-vex-defs.py --lo1 222.088540000 -r 1 > templates/230G/band3/freqs_ALMA_e24g11.vex
	#./scripts/alma-vex-defs.py --lo1 222.385741000 -r 1 > templates/230G/band4/freqs_ALMA_e24g11.vex
	#
	# However! The LO choice failed to stick to a 15625 Hz grid - unlike all other EHT/ALMA observations.
	# Hence DiFX cannot correlate "off-grid" ALMA against "on-grid" EHT stations with the above.
	# For producing VEX channels must use shifted LOs of [215591140625.0, 215091140625.0, 214088546875.0, 214385734375.0] Hz
	# and take out the error via v2d LO offsets of [-125, -125, -6875, 6625] Hz in [b1,b2,b3,b4]:
	#
	#$ehtc/alma-vex-defs.py -f215591.140625 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f215091.140625 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f214088.546875 -w58.0 -sL -ralma
	#$ehtc/alma-vex-defs.py -f214385.734375 -w58.0 -sL -ralma
	./scripts/alma-vex-defs.py --lo1 223.591140625 -r 1 > templates/230G/band1/freqs_ALMA_e24g11.vex
	./scripts/alma-vex-defs.py --lo1 223.091140625 -r 1 > templates/230G/band2/freqs_ALMA_e24g11.vex
	./scripts/alma-vex-defs.py --lo1 222.088546875 -r 1 > templates/230G/band3/freqs_ALMA_e24g11.vex
	./scripts/alma-vex-defs.py --lo1 222.385734375 -r 1 > templates/230G/band4/freqs_ALMA_e24g11.vex
	#
	## Note: DiFX $ehtc/alma-vex-defs.py would be more direct, but its chan_defs are not useable as-is,
	##       vs own ./scripts/alma-vex-defs.py usable for that but is not 4-8/5-9 aware plus b2 offset trickyness
	## SMA a priori clock CSV files
	# -- TODO 2024 --
	#./scripts/vexdelay.py -f ./priors/sma-delays.rx230.sbLSB.quad1.b1.csv -c 0.5126 --rate=-0.090e-12 -s Sw -g 0.0 2023y105d01h40m00s 2023y112d07h55m00s > templates/230G/band1/clocks_SMA.vex
	#./scripts/vexdelay.py -f ./priors/sma-delays.rx230.sbLSB.quad0.b2.csv -c 0.5126 --rate=-0.090e-12 -s Sw -g 0.0 2023y105d01h40m00s 2023y112d07h55m00s > templates/230G/band2/clocks_SMA.vex
	#./scripts/vexdelay.py -f ./priors/sma-delays.rx230.sbUSB.quad1.b3.csv -c 0.5126 --rate=-0.090e-12 -s Sw -g 0.0 2023y105d01h40m00s 2023y112d07h55m00s > templates/230G/band3/clocks_SMA.vex
	#./scripts/vexdelay.py -f ./priors/sma-delays.rx230.sbUSB.quad2.b4.csv -c 0.5126 --rate=-0.090e-12 -s Sw -g 0.0 2023y105d01h40m00s 2023y112d07h55m00s > templates/230G/band4/clocks_SMA.vex

etransferDirs:
	for exptname in $(TRACKS_ALL); do \
		mkdatadir $${exptname} ; \
		for station in Aa Ax Pv Lm Kt Mm KVN; do \
			mkdatadir $${exptname}/$${station} ; \
			mkdatadir $${exptname}/$${station}/12 ; \
			mkdatadir $${exptname}/$${station}/34 ; \
		done ; \
		mkdatadir $${exptname}/Nn ; \
		mkdatadir $${exptname}/Nn/1 ; \
		mkdatadir $${exptname}/Nn/2 ; \
		mkdatadir $${exptname}/Nn/3 ; \
		mkdatadir $${exptname}/Nn/4 ; \
	done


####################################################################################
## Build and install full correlation v2d vex config sets
####################################################################################

all: $(DIFX_TARGETS_ALL)

install: b1_install b2_install b3_install b4_install

diff: b1_diff b2_diff b3_diff b4_diff

%_install:
	for exptname in $(TRACKS_ALL); do \
		mkdir -p $(EXPROOT)/$${exptname}/$(REV)/$*/ ; \
		cp -av out/$${exptname}-${REL}-$*.{v2d,vex.obs} $(EXPROOT)/$${exptname}/$(REV)/$*/ ; \
	done

%_diff:
	for exptname in $(TRACKS_ALL); do \
		diff -u out/$${exptname}-$(REL)-$*.vex.obs $(EXPROOT)/$${exptname}/$(REV)/$*/$${exptname}-$(REL)-$*.vex.obs && true ; \
	done ; \
	for exptname in $(TRACKS_ALL); do \
		diff -u out/$${exptname}-$(REL)-$*.v2d $(EXPROOT)/$${exptname}/$(REV)/$*/$${exptname}-$(REL)-$*.v2d && true ; \
	done ; exit 0


####################################################################################
## EHT 2024 -- Band 1
####################################################################################

# Generic band 1 build patterns
%_b1_230:
	@ ./tvex2vex.py -I./templates/230G/band1/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b1.vex.obs
	@ ./tvex2vex.py -I./templates/230G/band1/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b1.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b1.vex.obs/g" out/$*-$(REL)-b1.v2d

%_b1_260:
	@ ./tvex2vex.py -I./templates/260G/band1/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b1.vex.obs
	@ ./tvex2vex.py -I./templates/260G/band1/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b1.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b1.vex.obs/g" out/$*-$(REL)-b1.v2d

%_b1_345:
	@ ./tvex2vex.py -I./templates/345G/band1/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b1.vex.obs
	@ ./tvex2vex.py -I./templates/345G/band1/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b1.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b1.vex.obs/g" out/$*-$(REL)-b1.v2d

# Custom-fiddled band 1 builds
# (none)

####################################################################################
## EHT 2024 -- Band 2
####################################################################################

# Generic band 2 build patterns
%_b2_230:
	@ ./tvex2vex.py -I./templates/230G/band2/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b2.vex.obs
	@ ./tvex2vex.py -I./templates/230G/band2/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b2.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b2.vex.obs/g" out/$*-$(REL)-b2.v2d

%_b2_260:
	@ ./tvex2vex.py -I./templates/260G/band2/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b2.vex.obs
	@ ./tvex2vex.py -I./templates/260G/band2/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b2.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b2.vex.obs/g" out/$*-$(REL)-b2.v2d

%_b2_345:
	@ ./tvex2vex.py -I./templates/345G/band2/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b2.vex.obs
	@ ./tvex2vex.py -I./templates/345G/band2/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b2.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b2.vex.obs/g" out/$*-$(REL)-b2.v2d

# Custom-fiddled band 2 builds
# (none)

####################################################################################
## EHT 2024 -- Band 3
####################################################################################

# Generic band 3 build patterns
%_b3_230:
	@ ./tvex2vex.py -I./templates/230G/band3/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b3.vex.obs
	@ ./tvex2vex.py -I./templates/230G/band3/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b3.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b3.vex.obs/g" out/$*-$(REL)-b3.v2d

%_b3_260:
	@ ./tvex2vex.py -I./templates/260G/band3/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b3.vex.obs
	@ ./tvex2vex.py -I./templates/260G/band3/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b3.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b3.vex.obs/g" out/$*-$(REL)-b3.v2d

%_b3_345:
	@ ./tvex2vex.py -I./templates/345G/band3/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b3.vex.obs
	@ ./tvex2vex.py -I./templates/345G/band3/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b3.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b3.vex.obs/g" out/$*-$(REL)-b3.v2d

# Custom-fiddled band 3 builds
# (none)

####################################################################################
## EHT 2024 -- Band 4
####################################################################################

# Generic band 4 build patterns
%_b4_230:
	@ ./tvex2vex.py -I./templates/230G/band4/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b4.vex.obs
	@ ./tvex2vex.py -I./templates/230G/band4/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b4.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b4.vex.obs/g" out/$*-$(REL)-b4.v2d

%_b4_260:
	@ ./tvex2vex.py -I./templates/260G/band4/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b4.vex.obs
	@ ./tvex2vex.py -I./templates/260G/band4/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b4.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b4.vex.obs/g" out/$*-$(REL)-b4.v2d

%_b4_345:
	@ ./tvex2vex.py -I./templates/345G/band4/ -I./templates/common_sections/ templates/$*.vext out/$*-$(REL)-b4.vex.obs
	@ ./tvex2vex.py -I./templates/345G/band4/ -I./templates/common_sections/ templates/$*.v2dt out/$*-$(REL)-b4.v2d
	@ sed -i "s/vexfilename/$*-${REL}-b4.vex.obs/g" out/$*-$(REL)-b4.v2d

# Custom-fiddled band 3 builds
# (none)

####################################################################################

