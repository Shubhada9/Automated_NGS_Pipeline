# Automated_NGS_Pipeline

## Overview
This repository contains a modular **Nextflow DSL2 pipeline** developed for basic NGS data quality control and preprocessing.

The pipeline performs:
1. Quality control of raw FASTQ files using **FastQC**
2. Adapter and quality trimming using **Cutadapt**
3. Quality control of trimmed reads using **FastQC**

This project was created as part of an academic assignment to demonstrate workflow automation, modular pipeline design, and reproducible bioinformatics analysis using Nextflow.

---



## Pipeline Workflow

```text
Input FASTQ files 
        ↓
   FASTQC_RAW 
        ↓
    CUTADAPT 
        ↓
  FASTQC_TRIM 
        ↓
   BWA_ALIGN
        ↓
  SAM_TO_BAM 
        ↓
   SORT_BAM 
        ↓
VARIANT_CALLING 
        ↓
FILTER_VARIANTS 
        ↓
Final VCF files 
```tignore
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



