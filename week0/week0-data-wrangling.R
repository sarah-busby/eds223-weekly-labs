packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "spDataLarge", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)

gdw_df <- read_csv(here("week0/data","gdw.csv")) |>
  clean_names()

print(head(gdw_df, n = 10))

print(tail(gdw_df, n = 10))

print(dim(gdw_df))
print(nrow(gdw_df))
print(ncol(gdw_df))

print(names(gdw_df))

country_df <- gdw_df[, 'country']
print(country_df)

country_vec <- gdw_df[['country']]
print(country_vec)

gdw_df |> 
  group_by(dam_type) |> 
  summarise(count = n()) |> 
  ungroup()

sub_dam <- gdw_df |> 
  filter(dam_type == "Dam")
print(sub_dam)

gdw_df <- gdw_df |> 
  arrange(year_dam)

keep_cols <- c('res_name', 'dam_name', 'dam_type', 'year_dam')
gdw_df[keep_cols]

gdw_df |> 
  group_by(country) |> 
  summarize(mean = mean(dam_hgt_m))

ggplot 