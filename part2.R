# get election data from internet
raw_elections_data <-
  read_csv(
    file = "table_tableau11.csv",
    show_col_types = FALSE
  )