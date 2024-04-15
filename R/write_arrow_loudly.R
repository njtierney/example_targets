#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param gap_data
#' @param nameme1
#' @return
#' @author njtierney
#' @export
write_arrow_loudly <- function(data, path = "data/gap_data.parquet") {

  write_parquet(
    x = data,
    sink = path
  )
  
  data

}
