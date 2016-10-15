library(BiocInstaller) # shouldn't be necessary


pkgs <- c(
	  "minfi",
	  "RnBeads",
	  "limma",
	  "gplots",
	  "TxDb.Hsapiens.UCSC.hg19.knownGene",
	  "ggplot2",
	  "epivizr",
	  "antiProfilesData",
	  "SummarizedExperiment",
	  "dplyr",
	  "IlluminaHumanMethylation450kmanifest",
	  "IlluminaHumanMethylation450kanno.ilmn12.hg19",
	  "FlowSorted.Blood.450k",
	  "qvalue"
	  )

ap.db <- available.packages(contrib.url(biocinstallRepos()))
ap <- rownames(ap.db)

pkgs_to_install <- pkgs[pkgs %in% ap]

biocLite(pkgs_to_install, suppressUpdates=TRUE)

# just in case there were warnings, we want to see them
# without having to scroll up:
warnings()

if (!is.null(warnings()))
{
	    w <- capture.output(warnings())
    if (length(grep("is not available|had non-zero exit status", w)))
	            quit("no", 1L)
}
