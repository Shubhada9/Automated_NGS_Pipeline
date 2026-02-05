process SAM_TO_BAM {
    tag "$sample_id"

    input:
    tuple val(sample_id), path(sam)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    ${params.samtools_bin} view -bS ${sam} > ${sample_id}.bam
    """
}