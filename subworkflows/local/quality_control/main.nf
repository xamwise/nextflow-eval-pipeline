include {quality_control} from '../modules/local/quality_control'
include {quality_control_sum} from '../modules/local/quality_control_sum'



workflow {
    quality_control(params.qc.input, params.qc.out, params.qc.maf, params.qc.mind, params.qc.geno, params.qc.hwe)
    quality_control_sum(params.qc_sum.input, params.qc_sum.out, params.qc_sum.info, params.qc_sum.maf)
}