#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author njtierney
#' @export
read_gapminder <- function() {

  gapminder |> 
    group_by(country) |> 
    mutate(year_centered = year - mean(year),
           .after = year) |> 
    ungroup()

}
