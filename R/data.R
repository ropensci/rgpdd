#' The biotype table
#'
#' @name gpdd_biotope
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' The data table
#'
#' stores the individual time series abundance records
#'
#' @name gpdd_data
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' The data source table
#'
#' Information on where the data was obtained from, relating to the
#' Main table through a unique DatasourceID.  Sources of data include
#' published journals, books and unpublished datasets and the references
#' details are held here.  The table also contains information regarding
#' access restrictions, contact details and in what medium the data was obtained.
#'
#' @name gpdd_datasource
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' Table of locations information for each timeseries
#'
#' @name gpdd_location
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' main table: metadata for each time series
#'
#' A MAIN record is a 'time series' which is unique
#' Taxon/Location/LifeCycle combination. Sequential data for multiple
#' life stages (e.g. eggs, larve and adults) are split into different
#' Main records and must be amalgamated to create a single time series.
#' Where more than one adult generation occurs per year generation is
#' identified in the generation column of the data table
#'
#' @name gpdd_main
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' Restricted data sets table
#'
#' Due to licensing restrictions 686 series from 6 sources cannot
#' be distributed without the permission of the owner. These are
#' data from the British Trust for Ornithology’s Common Bird Census
#' (97) and Constant Effort Recording Scheme (32), Rothamstead
#' Experimental Station, UK (9), the National monitoring programme
#' for wintering wildfowl in Norway 1980 – 93 (T. Nygard, 23),
#' Phalacrocorax carbo (Great cormorant) and Somateria mollissima
#' (Common eider) series supplied by N. Rov (2) and data from insect
#' light trapping supplied by H. Wolda (523).
#'
#' @name gpdd_restricted
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' The taxon table
#'
#' The taxon table stores the taxonomic names relating to Main records.
#' It is links to the MAIN table with a unique TaxonID.  Most series
#' are for species.  Some extra information regarding breeding habitats
#' etc may be found in the notes column
#'
#' @name gpdd_taxon
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' The time period table
#'
#' TimePeriod is a look-up table that provides text descriptions of
#' the temporal period the sample relates to such as 'January',
#' 'Spring', 'Week 1' and 'Day 1'.
#'
#' @name gpdd_timeperiod
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL

#' GPDD version information
#'
#' This is Version 2.0 (released 2010).
#' Version 1.0 (released in 1999) has now been superseded by v2.0 which includes the following enhancements,
#'
#' -  A consistent definition of a time-series.
#' - Consistent metadata.
#' - Units.
#' - Sampling protocol.
#' - Consistent temporal coding.
#' - Addition of missing location information, the spatial bounds of study areas and a spatial accuracy index.
#' - Abundance data are supplied ‘retro-transformed’ as well as in the published source units.
#' - Improved documentation.
#' - 123 additional time-series are included, courtesy of Barry Brook (University of Adelaide).
#' - Removal of un-cited associated data including body size and biotope information.
#'
#' @name gpdd_version
#' @docType data
#' @author GPDD Administrator \email{cpb-gpdd-dl@@imperial.ac.uk}
#' @references \url{http://www3.imperial.ac.uk/cpb/databases/gpdd}
#' @keywords data
NULL
