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
  ),
  
  tar_parquet(
    gap_parquet,
    write_parquet(
      gap_data,
      "data/gap_data.parquet"
    )
  ),
  
  sclfun <- function(red, path) {
    tbl <- tibble::tibble(red = red)
    write_parquet(tbl, path)
    tbl
  },
    tar_target(srcs, data.frame(red = 1:10)),
    tar_target(red, srcs$red),
    tar_target(i, seq_len(nrow(srcs))),
    ## I end up with three copies of the file vector, but only 'parquet' is monitored for file changes afaik
    tar_target(path, sprintf("data/%03i.parquet", i)),
    tar_parquet(files, sclfun(red, path), pattern = map(red, path))
# target = function_to_make(arg), ## drake style

# tar_target(target2, function_to_make2(arg)) ## targets style

)
