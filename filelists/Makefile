## Get global settings; TRACKS (e24...), REV (FRINGE), REL (0), SITE (mpifr), EXPROOT (/Exps)
include ../Makefile.inc

M6DIRS := /cluster/difx/directories/

all:
	@echo "Options:  'make bonn'  or  'make hays'"

mk6dir2filelist = grep "^e24" $(M6DIRS)/$(3).filelist | sort -k 2 | sed -e 's/^/\/$(1)_fuse\/$(2)\//' | cut -d' ' -f 1,2,3 > $(4)

bonn: aa_b1 aa_b4 ax_b1 ax_b4 gl_b1 gl_b4 mm_b1 mm_b4 mg_b1 mg_b4 \
	kt_b1 kt_b4 lm_b1 lm_b4 pv_b1 pv_b4 nn_b1 nn_b4 sw_b1 sw_b4 sz_b1 sz_b4

hays: pv_b2 pv_b3

## ALMA

aa_b1:
	$(call mk6dir2filelist,mark6-10,12,ALMA%009,ALMA_b1.12.filelist)
	$(call mk6dir2filelist,mark6-10,34,ALMA%011,ALMA_b1.34.filelist)

aa_b4:
	$(call mk6dir2filelist,mark6-10,12,ALMA%021,ALMA_b4.12.filelist)
	$(call mk6dir2filelist,mark6-10,34,ALMA%023,ALMA_b4.34.filelist)

## APEX
## https://eventhorizontelescope.mywikis.wiki/wiki/APEX_setup_2024

ax_b1:
	$(call mk6dir2filelist,mark6-09,12,MPI%8042,APEX_b1.12.filelist)
	$(call mk6dir2filelist,mark6-09,34,MPI%8044,APEX_b1.34.filelist)

ax_b2:
	$(call mk6dir2filelist,mark6-09,12,MPI%8046,APEX_b2.12.filelist)
	$(call mk6dir2filelist,mark6-09,34,MPI%8049,APEX_b2.34.filelist)

ax_b3:
	$(call mk6dir2filelist,mark6-09,12,ALMA%033,APEX_b3.12.filelist)
	$(call mk6dir2filelist,mark6-09,34,ALMA%035,APEX_b3.34.filelist)

ax_b4:
	$(call mk6dir2filelist,mark6-10,12,ALMA%041,APEX_b4.12.filelist)
	$(call mk6dir2filelist,mark6-10,34,ALMA%043,APEX_b4.34.filelist)

## GLT
## https://eventhorizontelescope.mywikis.wiki/wiki/GLT_(Gl)_setup_2024

gl_b1:
	$(call mk6dir2filelist,mark6-06,12,BHC%0042,GLT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,BHC%0049,GLT_b1.34.filelist)

gl_b2:
	$(call mk6dir2filelist,mark6-06,12,EHT%0067,GLT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,EHT%0069,GLT_b2.34.filelist)

gl_b3:
	$(call mk6dir2filelist,mark6-06,12,BHC%0118,GLT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,BHC%0120,GLT_b3.34.filelist)

gl_b4:
	$(call mk6dir2filelist,mark6-06,12,BHC%0170,GLT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-06,34,BHC%0176,GLT_b4.34.filelist)

## JCMT
## https://eventhorizontelescope.mywikis.wiki/wiki/JCMT_setup_2024

mm_b1:
	$(call mk6dir2filelist,mark6-11,12,BHC%0063,JCMT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-11,34,MPI%6406,JCMT_b1.34.filelist)

mm_b2:
	$(call mk6dir2filelist,mark6-11,12,BHC%0127,JCMT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-11,34,BHC%0126,JCMT_b2.34.filelist)

mm_b3:
	$(call mk6dir2filelist,mark6-11,12,MPI%6407,JCMT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-11,34,BHC%0038,JCMT_b3.34.filelist)

mm_b4:
	$(call mk6dir2filelist,mark6-08,12,MPI%6405,JCMT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-08,34,BHC%0168,JCMT_b4.34.filelist)

## Kitt Peak
## https://eventhorizontelescope.mywikis.wiki/wiki/KP_setup_2024

kt_b1:
	$(call mk6dir2filelist,mark6-02,12,ALMA%045,KT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-02,34,ALMA%047,KT_b1.34.filelist)

kt_b2:
	$(call mk6dir2filelist,mark6-02,12,SHAO%023,KT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-02,34,SHAO%025,KT_b2.34.filelist)

kt_b3:
	$(call mk6dir2filelist,mark6-02,12,SHAO%044,KT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-02,34,SHAO%046,KT_b3.34.filelist)

kt_b4:
	$(call mk6dir2filelist,mark6-02,12,SAO%0032,KT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-02,34,SAO%0034,KT_b4.34.filelist)

## LMT
## https://eventhorizontelescope.mywikis.wiki/wiki/LMT_2024_setup

lm_b1:
	$(call mk6dir2filelist,mark6-07,12,SHAO%036,LMT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-07,34,SHAO%039,LMT_b1.34.filelist)

lm_b2:
	$(call mk6dir2filelist,mark6-07,12,PERI%001,LMT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-07,34,ALMA%049,LMT_b2.34.filelist)

lm_b3:
	$(call mk6dir2filelist,mark6-07,12,SHAO%001,LMT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-07,34,SHAO%022,LMT_b3.34.filelist)

lm_b4:
	$(call mk6dir2filelist,mark6-07,12,SHAO%002,LMT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-07,34,SHAO%004,LMT_b4.34.filelist)

## NOEMA
## https://eventhorizontelescope.mywikis.wiki/wiki/NOEMA_setup_2024
	
nn_b1:
	$(call mk6dir2filelist,mark6-09,1,IRAM%009,NOEMA_b1.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,IRAM%010,NOEMA_b1.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,IRAM%011,NOEMA_b1.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,IRAM%012,NOEMA_b1.4.filelist)

nn_b2:
	$(call mk6dir2filelist,mark6-09,1,IRAM%013,NOEMA_b2.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,IRAM%014,NOEMA_b2.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,IRAM%015,NOEMA_b2.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,IRAM%016,NOEMA_b2.4.filelist)

nn_b3:
	$(call mk6dir2filelist,mark6-09,1,BHC%0164,NOEMA_b3.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,BHC%0165,NOEMA_b3.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,BHC%0166,NOEMA_b3.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,BHC%0167,NOEMA_b3.4.filelist)

nn_b4:
	$(call mk6dir2filelist,mark6-09,1,BHC%0164,NOEMA_b4.1.filelist)
	$(call mk6dir2filelist,mark6-09,2,BHC%0165,NOEMA_b4.2.filelist)
	$(call mk6dir2filelist,mark6-09,3,BHC%0166,NOEMA_b4.3.filelist)
	$(call mk6dir2filelist,mark6-09,4,BHC%0167,NOEMA_b4.4.filelist)

## Pico
## https://eventhorizontelescope.mywikis.wiki/wiki/IRAM30m_setup_2024

pv_b1:
	$(call mk6dir2filelist,mark6-05,12,SAO%0017,Pico_b1.12.filelist)
	$(call mk6dir2filelist,mark6-05,34,SAO%0020,Pico_b1.34.filelist)

pv_b2:
	$(call mk6dir2filelist,mark6-05,12,SAO%0045,Pico_b2.12.filelist)
	$(call mk6dir2filelist,mark6-05,34,SAO%0047,Pico_b2.34.filelist)

pv_b3:
	$(call mk6dir2filelist,mark6-05,12,MPI%8002,Pico_b3.12.filelist)
	$(call mk6dir2filelist,mark6-05,34,MPI%8009,Pico_b3.34.filelist)

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
## https://eventhorizontelescope.mywikis.wiki/wiki/SMT_setup_2024

mg_b1:
	$(call mk6dir2filelist,mark6-04,12,SHAO%015,SMT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,SHAO%017,SMT_b1.34.filelist)

mg_b2:
	$(call mk6dir2filelist,mark6-04,12,SHAO%019,SMT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,SHAO%028,SMT_b2.34.filelist)

mg_b3:
	$(call mk6dir2filelist,mark6-04,12,SHAO%053,SMT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,SHAO%055,SMT_b3.34.filelist)

mg_b4:
	$(call mk6dir2filelist,mark6-04,12,SHAO%034,SMT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,SHAO%041,SMT_b4.34.filelist)

## SPT
## https://eventhorizontelescope.mywikis.wiki/wiki/SPT_setup_2024

sz_b1:
	$(call mk6dir2filelist,mark6-04,12,ALMA%029,SPT_b1.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,ALMA%031,SPT_b1.34.filelist)

sz_b2:
	$(call mk6dir2filelist,mark6-04,12,MPI%8038,SPT_b2.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,MPI%8041,SPT_b2.34.filelist)

sz_b3:
	$(call mk6dir2filelist,mark6-04,12,ALMA%037,SPT_b3.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,ALMA%039,SPT_b3.34.filelist)

sz_b4:
	$(call mk6dir2filelist,mark6-04,12,MPI%8051,SPT_b4.12.filelist)
	$(call mk6dir2filelist,mark6-04,34,MPI%8054,SPT_b4.34.filelist)


## CHECKING

buglist:
	# All scans that have unexpected time stamps
	grep -v " 604\| 603" *.filelist || true
	grep " 51544." *.filelist || true


## COPY

install:
	for exptname in $(TRACKS_230G) $(TRACKS_260G) $(TRACKS_345G); do \
		mkdir -p /Exps/$${exptname}/$(REV)/b1/ ; \
		mkdir -p /Exps/$${exptname}/$(REV)/b4/ ; \
	done
	for exptname in $(TRACKS_230G) $(TRACKS_260G) $(TRACKS_345G); do \
		cp -a *_b1.* /Exps/$${exptname}/$(REV)/b1/ ; \
		cp -a *_b4.* /Exps/$${exptname}/$(REV)/b4/ ; \
	done
