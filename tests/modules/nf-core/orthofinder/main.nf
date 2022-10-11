#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { ORTHOFINDER } from '../../../../modules/nf-core/orthofinder/main.nf'

workflow test_orthofinder {
    
    input = file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true)

    ORTHOFINDER ( input )
}
