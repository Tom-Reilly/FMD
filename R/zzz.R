is_attached <- function(pkg) paste0("package:", pkg) %in% search()
  
when_attached <- function(pkg, action) {
  if(is_attached(pkg)) {action}
}

when_attached("FMD",odbcConnect())
