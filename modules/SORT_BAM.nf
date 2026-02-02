process SORT_BAM {
    tag "$sample_id"
    publishDir "${params.outdir}/aligned", mode: 'copy'

    input:
    tuple val(sample_id), path(bam)

    output:
    tuple val(sample_id), path("${sample_id}_sorted.bam")

    script:
    """
    ${params.samtools_bin} sort ${bam} -o ${sample_id}_sorted.bam
    """
}