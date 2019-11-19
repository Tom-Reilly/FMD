odbcConnect <- function() {

  cat("Connecting to FMD")

  cat("\n----------------------------------------------------------------------------\n")

  # Set up the connection to FMD
  # Use package odbc

  # Set up DSN so that server details not stored here
  # Set DSN user id and password and request here

  counter = 0
  max_tries = 3

  res <- simpleError("Fake error to start") # Create a dummy error to be tested against and is overwritten by the connection if no error

  while(inherits(res, "error") & counter < max_tries) { # inherits indicates whether its first argument inherits from any of the classes specified in the what argument
    res = tryCatch(
      {con = DBI::dbConnect(
        drv = odbc::odbc(),
        dsn = "FSS", # data source name
        uid = rstudioapi::askForPassword("Database User:"), # rofss
        pwd = rstudioapi::askForPassword("Database Password:")) # mssfss
      if(is(con, "Microsoft SQL Server")) {assign("con", con, envir = .GlobalEnv)}
      cat("Connection with FMD established")
      },
      error = function(e) {
        cat("Incorrect username or password, please try again\n")
        e
      })
    counter <- counter + 1
  }
  
  cat("\n----------------------------------------------------------------------------\n")

}
