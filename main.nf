include { NGS_PIPELINE } from './workflows/ngs_workflow'

workflow {
    read_pairs_ch = Channel.fromFilePairs(params.input_fastq)
    
    // Wrap the genome reference string in file()
    genome_file = file(params.genome_ref)

    read_pairs_ch.view { "Found Sample: $it" }

    // Pass the file object instead of the string
    NGS_PIPELINE(read_pairs_ch, genome_file)
}