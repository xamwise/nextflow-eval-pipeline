process quality_control{

    tag "${name}"
    label 'process_single'
    publishDir "out/${params.run_id}/quality_control", mode: 'copy'

    input:
    path input
    val out
    val maf
    val mind
    val geno
    val hwe

    output:
    path('quality_control*.html'), emit: prs_csx, optional: true

    script:
    """
    plink --bfile ($input) \\
        --maf $maf \\
        --mind $mind \\
        --geno $geno \\
        --hwe $hwq \\
        --make-just-bim \\
        --make-just-fam \\
        --out ($out).qc
    """
}