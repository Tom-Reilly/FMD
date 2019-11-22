.onAttach <- function(libname, pkgname) {
odbcConnect()
rstudioapi::showQuestion(title = "CFS UI", message = "Would you like to open the CFS interactive UI?")
}

