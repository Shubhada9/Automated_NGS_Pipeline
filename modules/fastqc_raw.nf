process FASTQC_RAW {
    tag "$sample_id"
    publishDir "${params.outdir}/fastqc_raw", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*.html"

    script:
    """
    ${params.fastqc_bin} ${reads}
    """
}