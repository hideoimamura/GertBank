#https://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r

library("primerTree")

in1 <-"Gert.genebank.txt"
con  <- file(in1, open = "r")

printf <- function(...) cat(sprintf(...))		
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  #print(oneLine)
  fields = strsplit(oneLine, '\t') [[1]]
  #print(c(fields[1], fields[2], fields[3]))

  printf("%s %s %s\n", fields[1], fields[2], fields[3])
  tag <- toString(fields[1])
  print(tag)
  s2  <- get_sequence(tag, start =fields[2], stop =fields[3])
  p2  <- as.character(s2)
  out <- lapply(p2, function(x) paste0(x, collapse = ''))
  print(out)
  
} 

close(con)
