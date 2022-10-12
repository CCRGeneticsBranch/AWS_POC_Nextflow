process multiqc {
        tag { dataset_id }
        publishDir "$params.resultsdir/$dataset_id", mode: 'move'
        input:
        tuple val(dataset_id),
        path(qc)
        output:
        path "multiqc_report.html"
//      tuple val("${dataset_id}"), path("trim_${dataset_id}_multiqc_report.html")
        container 'docker://nciccbr/ccbr_multiqc_1.9:v0.0.1'

        script:
        """
        multiqc -m fastqc .

        """

}

