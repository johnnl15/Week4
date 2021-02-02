library(dbplyr)
library(DBI)

data(mtcars)

con <- DBI::dbConnect(RSQLite::SQLite(), "mtcars.sqlite3")
DBI::dbWriteTable(con, "mtcars", mtcars)
DBI::dbDisconnect(con)