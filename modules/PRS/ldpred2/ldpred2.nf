process ldpred2 {

    tag "${name}"
    label 'process_single'
    publishDir "out/${params.run_id}/ldpred2", mode: 'copy'

    input:
    path bed, pheno, cov, pcs, ld, sum_stats
    val trait, model

    output:
    path('ldpred2*.html'), emit: ldpred2, optional: true

    script:
    """
    Rscript LDpred-2.R \\ 
        --bed $bed \\
        --pheno $pheno \\
        --cov $cov \\
        --pcs $pcs \\
        --ld $ld \\
        --sum_stats $sum_stats \\
        --trait $trait \\
        --model $model 
    """

}