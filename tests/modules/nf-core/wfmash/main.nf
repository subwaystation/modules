#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { WFMASH } from '../../../../modules/nf-core/wfmash/main.nf'

workflow test_wfmash {

    input = [ [ id:'test' ], // meta map
              [ file(params.test_data['homo_sapiens']['pangenome']['pangenome_fa_bgzip'], checkIfExists: true) ]
            ]
    gzi = file(params.test_data['homo_sapiens']['pangenome']['pangenome_fa_bgzip_gzi'], checkIfExists: true)
    fai = file(params.test_data['homo_sapiens']['pangenome']['pangenome_fa_bgzip_fai'], checkIfExists: true)
    do_query = true

    WFMASH ( input, do_query, gzi, fai, [], [] )
}
