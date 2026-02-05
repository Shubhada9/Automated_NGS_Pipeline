include { FASTQC_RAW } from '../modules/fastqc_raw'
include { CUTADAPT } from '../modules/cutadapt'
include { BWA_INDEX } from '../modules/bwa_index'
include { FASTA_INDEX } from '../modules/fasta_index' // Add this
include { BWA_ALIGN } from '../modules/bwa_align'
include { SAM_TO_BAM } from '../modules/sam_to_bam'
include { SORT_BAM } from '../modules/sort_bam'
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
