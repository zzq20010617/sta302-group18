# Generate graphs from cleaned data
cleaned_elections_data <-
  read_csv(
    file = "cleaned_elections_data.csv",
    show_col_types = FALSE
  )

cleaned_elections_data |>
  count(party)

cleaned_elections_data |>
  ggplot(aes(x = party)) +  
  geom_bar()

cleaned_elections_data |>
  ggplot(aes(x = party)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Party", y = "Number of seats")