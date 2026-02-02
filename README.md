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