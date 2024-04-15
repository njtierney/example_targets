## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(
  
  gap_data = read_gapminder(),
  lm_gapminder = fit_lm_gapminder(gap_data),
  tidy_lm_gapminder = tidy_lm(lm_gapminder),
  plot_gapminder = gg_gapminder(tidy_lm_gapminder,
                                gap_data),
  tar_render(explore, "doc/explore.Rmd"),
  tar_file(
    gap_csv,
    write_csv_loudly(gap_data,
                     "data/gap_data.csv")
  )
# target = function_to_make(arg), ## drake style

# tar_target(target2, function_to_make2(arg)) ## targets style

)
