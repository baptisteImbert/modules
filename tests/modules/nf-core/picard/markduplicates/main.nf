#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { PICARD_MARKDUPLICATES } from '../../../../../modules/nf-core/picard/markduplicates/main.nf'
include { PICARD_MARKDUPLICATES as PICARD_MARKDUPLICATES_UNSORTED}  from '../../../../../modules/nf-core/picard/markduplicates/main.nf'

workflow test_picard_markduplicates_sorted_bam  {
    input = [ [ id:'test', single_end:false ], // meta map
              file(params.test_data['sarscov2']['illumina']['test_paired_end_sorted_bam'], checkIfExists: true)
            ]

    PICARD_MARKDUPLICATES ( input )
}

workflow test_picard_markduplicates_unsorted_bam  {
    input = [ [ id:'test', single_end:false ], // meta map
              file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
            ]

    PICARD_MARKDUPLICATES_UNSORTED ( input )
}
