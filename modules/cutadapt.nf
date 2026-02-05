process CUTADAPT {
    tag "$sample_id"
    publishDir "${params.outdir}/trimmed", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("tr_${sample_id}_{1,2}.fastq.gz")

    script:
    """
    ${params.cutadapt_bin} -o tr_${sample_id}_1.fastq.gz -p tr_${sample_id}_2.fastq.gz ${reads[0]} ${reads[1]}
    """
}