process BWA_ALIGN {
    tag "$sample_id"
    
    input:
    tuple val(sample_id), path(reads)
    path genome
    path index_files

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    ${params.bwa_bin} mem ${genome} ${reads[0]} ${reads[1]} > ${sample_id}.sam
    """
}