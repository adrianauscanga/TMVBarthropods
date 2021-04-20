# TMVBarthropods
This is the repository for data used in my master's thesis project *"Evaluating species origins within tropical sky-islands arthropod communities"*, published in the Journal of Biogeography.
This repository contains code for delimiting Operational Taxonomic Units (OTUs) using a Generalized Mixed Yule Coalescent method (GMYC) and CROP, estimate genetic and specific diversity, and run a null model. It also contains the sequences and trees needed to run the code.
Here is a brief description of the files contained in this repo:

**otus_delimitation**. R code for delimiting OTUs using trees calculated in BEAST

**diversity**. R code for calculating genetic diversity, Fst and making haplotype networks. It also contains R code for calculatin beta diversity using OTUs

**habitat**. R code for identifying the habitat type of each specimen (branch) in each tree

**EW_nullmodel**. R code for making a null model with which I tested the east-west structure present in the TMVB

**sequences_fasta**. Contains all the sequences used in the project in fasta format. Sequences are grouped by order (e.g. Colepotera) and by OTUs

**trees**. Contains all the trees built in BEAST and used in this project.

**OTUs**. CSV file with a table of the number of individuals from each OTU (44 OTUs total) present in each mountain (7 mountains). This file is used for calculating a presence-absence matrix. Notice there is no OTU number 9, because this was found to be product of a sequencing error in downstream analyses and thus was deleted.

## Prerequisites
Software:
* BEAST, BEAUTI and treeanotator
* R libraries *"splits", "ape", "MASS", "paran", "ape", "ade4", "adegenet", "diveRsity", "pegas", "vegan"*

Data:
* Sequences in fasta format
* Ultrametric trees 

