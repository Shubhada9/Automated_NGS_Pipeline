include { FASTQC_RAW } from '../modules/FASTQC_RAW'
include { CUTADAPT } from '../modules/CUTADAPT'
include { BWA_INDEX } from '../modules/BWA_INDEX'
include { FASTA_INDEX } from '../modules/FASTA_INDEX' // Add this
include { BWA_ALIGN } from '../modules/BWA_ALIGN'
include { SAM_TO_BAM } from '../modules/SAM_TO_BAM'
include { SORT_BAM } from '../modules/SORT_BAM'
include { VARIANT_CALLING; FILTER_VARIANTS } from '../modules/variant_discovery'

workflow NGS_PIPELINE {
    take:
        read_pairs_ch
        genome_file

    main:
        FASTQC_RAW(read_pairs_ch)
        CUTADAPT(read_pairs_ch)
        
        // Indexing
        BWA_INDEX(genome_file)
        FASTA_INDEX(genome_file) // Generate the .fai file
        
        // Alignment & Processing
        BWA_ALIGN(CUTADAPT.out, genome_file, BWA_INDEX.out)
        SAM_TO_BAM(BWA_ALIGN.out)
        SORT_BAM(SAM_TO_BAM.out)
        
        // Variant discovery - passing the genome and its fai index
        VARIANT_CALLING(SORT_BAM.out, genome_file, FASTA_INDEX.out)
        FILTER_VARIANTS(VARIANT_CALLING.out)
}