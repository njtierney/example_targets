#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param gap_data
#' @return
#' @author njtierney
#' @export
write_csv_loudly <- function(gap_data, path) {

  fs::dir_create(here::here("data"))
  
  write_csv(
    x = gap_data, 
    file = path
    )
  
  # return the path
  path

}
