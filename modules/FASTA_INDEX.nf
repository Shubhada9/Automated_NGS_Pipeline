process FASTA_INDEX {
    tag "$genome"

    input:
    path genome

    output:
    path "${genome}.fai"

    script:
    """
    ${params.samtools_bin} faidx ${genome}
    """
}