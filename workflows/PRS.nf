include { quality_control } from '../modules/local/quality_control'
include { baselinePRS } from '../subworkflows/local/baselinePRS'

workflow {
    quality_control()
    baselinePRS()
}