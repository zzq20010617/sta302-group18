# Data cleaning and saving to new csv file
# Make the names easier to type
cleaned_elections_data <-
  clean_names(raw_elections_data)

# Have a look at the first six rows
#head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  select(
    electoral_district_name_nom_de_circonscription,
    elected_candidate_candidat_elu
  )
#head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  rename(
    district = electoral_district_name_nom_de_circonscription,
    elected_candidate = elected_candidate_candidat_elu
  )

cleaned_elections_data <-
  cleaned_elections_data |>
  separate(
    col = elected_candidate,
    into = c("Other", "party"),
    sep = "/"
  ) |>
  select(-Other)

head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  mutate(
    party =
      case_match(
        party,
        "Libéral" ~ "Liberal",
        "Conservateur" ~ "Conservative",
        "Bloc Québécois" ~ "Bloc Québécois",
        "NPD-Nouveau Parti démocratique" ~ "New Democratic",
        "Parti Vert" ~ "Green"
      )
  )

head(cleaned_elections_data)

write_csv(
  x = cleaned_elections_data,
  file = "cleaned_elections_data.csv"
)