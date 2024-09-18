## Get global settings; TRACKS (e24...), REV (FRINGE), REL (0), SITE (mpifr), EXPROOT (/Exps)
include ../Makefile.inc

M6DIRS := /cluster/difx/directories/

all:
	@echo "Options:  'make bonn'  or  'make hays'"

mk6dir2filelist = grep "^e24" $(M6DIRS)/$(3).filelist | sort -k 2 | sed -e 's/^/\/$(1)_fuse\/$(2)\//' | cut -d' ' -f 1,2,3 > $(4)

bonn: aa_b1 aa_b4 ax_b1 ax_b4 gl_b1 gl_b4 mm_b1 mm_b4 mg_b1 mg_b4 \
	kt_b1 kt_b4 lm_b1 lm_b4 nn_b1 nn_b4 sw_b1 sw_b4 sz_b1 sz_b4

hays: pv_b2 pv_b3

## ALMA

aa_b1:
	$(call mk6dir2filelist,mark6-10,12,ALMA%009,ALMA_b1.12.filelist)
	$(call mk6dir2filelist,mark6-10,34,ALMA%011,ALMA_b1.34.filelist)

aa_b4: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-10,12,...,ALMA_b4.12.filelist)
	#$(call mk6dir2filelist,mark6-10,34,...,ALMA_b4.34.filelist)

## APEX

ax_b1:
	$(call mk6dir2filelist,mark6-09,12,MPI%8042,APEX_b1.12.filelist)
	$(call mk6dir2filelist,mark6-09,34,MPI%8044,APEX_b1.34.filelist)

ax_b4:
	$(call mk6dir2filelist,mark6-10,12,ALMA%041,APEX_b1.12.filelist)
	$(call mk6dir2filelist,mark6-10,34,ALMA%043,APEX_b1.34.filelist)

## GLT

gl_b1:
	$(call mk6dir2filelist,mark6-06,12,BHC%0042,GLT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,BHC%0049,GLT_b1.34.filelist)

gl_b4:
	$(call mk6dir2filelist,mark6-06,12,BHC%0170,GLT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,BHC%0176,GLT_b4.34.filelist)

## JCMT

mm_b1:
	$(call mk6dir2filelist,mark6-11,12,BHC%0063,JCMT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-11,34,MPI%6406,JCMT_b1.34.filelist)

mm_b4:
	$(call mk6dir2filelist,mark6-08,12,MPI%6405,JCMT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-08,34,BHC%0168,JCMT_b4.34.filelist)

## Kitt Peak

kt_b1:
	#$(call mk6dir2filelist,mark6-02,12,...,KT_b1.12.filelist)
	#$(call mk6dir2filelist,mark6-02,34,...,KT_b1.34.filelist)

kt_b4:
	#$(call mk6dir2filelist,mark6-02,12,...,KT_b4.12.filelist)
	#$(call mk6dir2filelist,mark6-02,34,...,KT_b4.34.filelist)

## LMT

lm_b1:
	#$(call mk6dir2filelist,mark6-07,12,...,LMT_b1.12.filelist)
	#$(call mk6dir2filelist,mark6-07,34,...,LMT_b1.34.filelist)

lm_b4:
	#$(call mk6dir2filelist,mark6-07,12,...,LMT_b4.12.filelist)
	#$(call mk6dir2filelist,mark6-07,34,...,LMT_b4.34.filelist)

## NOEMA
	
nn_b1:
	$(call mk6dir2filelist,mark6-09,1,IRAM%009,NOEMA_b1.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,IRAM%010,NOEMA_b1.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,IRAM%011,NOEMA_b1.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,IRAM%012,NOEMA_b1.4.filelist)

nn_b4:
	$(call mk6dir2filelist,mark6-09,1,BHC%0164,NOEMA_b4.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,BHC%0165,NOEMA_b4.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,BHC%0166,NOEMA_b4.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,BHC%0167,NOEMA_b4.4.filelist)

## Pico

pv_b1:
	$(call mk6dir2filelist,mark6-05,12,SAO%0017,Pico_b1.12.filelist)
	$(call mk6dir2filelist,mark6-05,34,SAO%0020,Pico_b1.34.filelist)

pv_b4:
	$(call mk6dir2filelist,mark6-05,12,MPI%8013,Pico_b4.12.filelist)
	$(call mk6dir2filelist,mark6-05,34,MPI%8016,Pico_b4.34.filelist)

## SMA APHIDS - todo

sw_b1: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-05,12,...,SMA_b1.12.filelist)
	#$(call mk6dir2filelist,mark6-05,34,...,SMA_b1.34.filelist)

sw_b4: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-05,12,...,SMA_b4.12.filelist)
	#$(call mk6dir2filelist,mark6-05,34,...,SMA_b4.34.filelist)

## SMT

mg_b1: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-04,12,SHAO%015,SMT_b1.12.filelist)
	#$(call mk6dir2filelist,mark6-04,34,SHAO%017,SMT_b1.34.filelist)

mg_b4: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-04,12,SHAO%034,SMT_b4.12.filelist)
	#$(call mk6dir2filelist,mark6-04,34,SHAO%041,SMT_b4.34.filelist)

## SPT

sz_b1: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-04,12,ALMA%029,SPT_b1.12.filelist)
	#$(call mk6dir2filelist,mark6-04,34,ALMA%031,SPT_b1.34.filelist)

sz_b4: # todo, not shipped yet (as of 10/2024)
	#$(call mk6dir2filelist,mark6-04,12,MPI%8051,SPT_b4.34.filelist)
	#$(call mk6dir2filelist,mark6-04,34,MPI%8053,SPT_b4.12.filelist)


## CHECKING

buglist:
	# All scans that have unexpected time stamps
	grep -v " 600" *.filelist || true
	grep " 51544." *.filelist || true


## COPY

install:
	#for exptname in $(TRACKS); do \
	#	mkdir -p /Exps/$${exptname}/$(REV)/b1/ /Exps/$${exptname}/$(REV)/b1_outputbands/ ; \
	#	mkdir -p /Exps/$${exptname}/$(REV)/b4/ /Exps/$${exptname}/$(REV)/b4_outputbands/ ; \
	#done
	#
	# Outputband correlation subdirs
	for exptname in $(TRACKS); do \
		cp -a *_b1.* /Exps/$${exptname}/$(REV)/b1_outputbands/ ;	\
		cp -a *_b4.* /Exps/$${exptname}/$(REV)/b4_outputbands/;		\
	done
	#
	# Zoom correlation subdirs
	for exptname in $(TRACKS); do \
		cp -a *_b1.* /Exps/$${exptname}/$(REV)/b1/ ;	\
		cp -a *_b4.* /Exps/$${exptname}/$(REV)/b4/;		\
	done
