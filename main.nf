#!/usr/bin/env nextflow

params.input_dir="$projectDir/input/"
params.outdir="results"
params.thresh_moving=0

workflow {
    plot()
}

process plot {
    tag "R_plot"

    publishDir params.outdir, mode:'copy'

    output:
    path "plot.png"
    
    script:
    """
    #!/usr/bin/env Rscript
    x <- rnorm(100)
    y <- rnorm(100)
    png('plot.png', width=800, height=600)
    plot(x, y, main = "Plot", xlab = "x", ylab = "y")
    dev.off()
    """
}


