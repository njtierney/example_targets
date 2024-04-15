#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param gap_data
#' @return
#' @author njtierney
#' @export
fit_lm_gapminder <- function(gap_data) {

  lm(
    formula = lifeExp ~ .,
    data = gap_data
  )

}
