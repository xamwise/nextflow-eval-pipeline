process prset {

    tag "${name}"
    label 'process_single'
    publishDir "out/${params.run_id}/prset", mode: 'copy'

    input:
    path base, pheno, target, out
    val snp
    val a1
    val a2
    val stat
    val beta
    val pvalue
    val binary_target
    val bar_levels
    val no_full
    val fastscore
    val bed


    output:
    path('prset*.html'), emit: prs_csx, optional: true

    script:
    """
    Rscript PRSet.R \\
        --prsice PRSice_mac \\
        --base $base  \
        --target $target \\
        --snp $snp \\
        --A1 $a1 \\
        --A2 $a2 \\
        --stat $stat \\
        --beta $beta \\
        --pvalue $pvalue \\
        --pheno $pheno \\
        --binary-target $binary_target \\
        --bar-levels $bar_levels \\
        --no-full $no_full \\
        --fastscore $fastscore \\
        --bed $bed \\
        --multi-plot 10 \\
        --out $out 
    """

}