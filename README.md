# Automated_NGS_Pipeline

## Overview
This repository contains a modular **Nextflow DSL2 pipeline** developed for basic NGS data quality control and preprocessing.

The pipeline performs:
1. Quality control of raw FASTQ files using **FastQC**
2. Adapter and quality trimming using **Cutadapt**
3. Quality control of trimmed reads using **FastQC**

This project was created as part of an academic assignment to demonstrate workflow automation, modular pipeline design, and reproducible bioinformatics analysis using Nextflow.

---
### 1. Clone the Repository
```bash
https://github.com/Shubhada9/Automated_NGS_Pipeline.git
```
## Directory Structure

```text
Automated_NGS_Pipeline/
├── modules/                    # Nextflow module files
│   ├── fastqc_raw.nf          # Raw read QC
│   ├── cutadapt.nf            # Adapter trimming
│   ├── fasta_index.nf         # Reference indexing
│   ├── bwa_index.nf           # BWA index creation
│   ├── bwa_align.nf           # Read alignment
│   ├── sam_to_bam.nf          # Format conversion
│   ├── sort_bam.nf            # BAM sorting
│   └── variant_discovery.nf   # Variant calling
├── workflows/                  # Workflow definitions
├── main.nf                     # Main pipeline script
├── nextflow.config             # Pipeline configuration
├── env.yml                     # Conda environment
├── README.md                   # Documentation
└── .gitignore                 # Git ignore rules
```
## Key Features

* **End-to-end automation** from raw reads to filtered variants
* **Multi-sample support** with parallel execution
* **Quality metrics** generated at each step
* **Standardized output formats** (BAM, VCF)
* **Cross-platform compatibility**
* **Environment management** via Conda

## Purpose

Sequencing instruments produce raw data that contains errors and technical artifacts. This pipeline addresses these challenges by:
- Identifying and removing low-quality sequences
- Accurately mapping reads to their genomic origins
- Distinguishing true genetic variations from sequencing errors
- Delivering ready-to-analyze variant files for research applications
  
## How to Run the Pipeline

```
conda env create -f environment.yml
conda activate nextflow-qc
nextflow run main.nf
```

### Explanation of Commands

- `conda env create -f environment.yml` → Creates the Conda environment with required tools  
- `conda activate nextflow-qc` → Activates the environment  
- `nextflow run main.nf` → Executes the Nextflow pipeline





