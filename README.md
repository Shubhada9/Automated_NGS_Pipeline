# Automated Variant Calling Pipeline (Nextflow)

A high-performance, modular Nextflow solution designed to automate the transition from raw genomic sequencing reads to filtered variant calls (VCF). This pipeline integrates industry-standard bioinformatics tools within a strictly structured, reproducible framework.

---

## ⚙️ Pipeline Workflow
The architecture is designed for maximum modularity, ensuring each stage of the genomic analysis is isolated and verifiable.

[Image of an NGS variant calling pipeline workflow diagram showing the progression from FASTQ to VCF]

```text
      [ Raw FASTQ Reads ]
              ↓
        ( FASTQC_RAW )  ──> [ Quality Reports ]
              ↓
        (  CUTADAPT  )  ──> [ Trimmed Reads ]
              ↓
       ( BWA_INDEXING ) ──> [ Genome Indices ]
              ↓
        ( BWA_ALIGN  )  ──> [ SAM Alignment ]
              ↓
       (  SAM_TO_BAM )  ──> [ Binary Format ]
              ↓
       (   SORT_BAM  )  ──> [ Coordinate Sorted BAM ]
              ↓
     ( VARIANT_CALLING )──> [ Raw VCF ]
              ↓

     ( FILTER_VARIANTS )──> [ Final High-Quality VCF ]
## Overview

This pipeline transforms raw sequencing data into high-confidence variant calls through an eight-stage processing workflow:

1. **Initial QC (FastQC)** - Evaluate raw read quality and detect potential issues in sequencing data

2. **Read Cleaning (Cutadapt)** - Trim adapter sequences and remove poor-quality bases from read ends

3. **QC Verification (FastQC)** - Confirm successful trimming and assess improved data quality

4. **Genome Mapping (BWA-MEM)** - Align processed reads to a reference genome assembly

5. **File Conversion (Samtools)** - Transform alignments from SAM to space-efficient BAM format

6. **Coordinate Sorting (Samtools)** - Organize aligned reads by genomic position

7. **Variant Discovery (BCFtools)** - Detect single nucleotide polymorphisms (SNPs) and insertions/deletions (indels)

8. **Quality Filtering (BCFtools)** - Retain only variants meeting quality thresholds

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
