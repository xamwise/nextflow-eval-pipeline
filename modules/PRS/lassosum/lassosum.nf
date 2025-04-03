process lassosum {

    tag "${name}"
    label 'process_single'
    publishDir "out/${params.run_id}/lassosum", mode: 'copy'

    input:
    path bed, pheno, cov, pcs, ld, sum_stats

    output:
    path('lassosum*.html'), emit: lassosum, optional: true

    script:
    """
    Rscript lassosum.R \\ 
        --bed $bed \\
        --pheno $pheno \\
        --cov $cov \\
        --pcs $pcs \\
        --ld $ld \\
        --sum_stats $sum_stats 
    """

}