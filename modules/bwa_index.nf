process BWA_INDEX {
    tag "$genome"

    input:
    path genome

    output:
    path "${genome}.*"

    script:
    """
    ${params.bwa_bin} index ${genome}
    """
}