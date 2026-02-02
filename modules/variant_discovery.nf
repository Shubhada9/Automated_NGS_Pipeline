process VARIANT_CALLING {
    tag "$sample_id"

    input:
    tuple val(sample_id), path(bam)
    path genome
    path genome_fai

    output:
    tuple val(sample_id), path("${sample_id}_raw.vcf")

    script:
    """
    ${params.bcftools_bin} mpileup -f ${genome} ${bam} | \
    ${params.bcftools_bin} call -mv -o ${sample_id}_raw.vcf
    """
}

process FILTER_VARIANTS {
    tag "$sample_id"
    publishDir "${params.outdir}/final_vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(vcf)

    output:
    path "${sample_id}_filtered.vcf"

    script:
    """
    ${params.bcftools_bin} view -i 'QUAL>20' ${vcf} -o ${sample_id}_filtered.vcf
    """
}