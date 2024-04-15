#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param lm_gapminder
#' @return
#' @author njtierney
#' @export
tidy_lm <- function(lm_gapminder) {

  broom::tidy(lm_gapminder)

}
