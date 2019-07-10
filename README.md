# GertBank
The R script will extract sequences for a given GeneBank ID, start and end information.
It will just print out sequences and their information

GeneBankID start end
>cat Gert.genebank.txt #your input file
DY763151	150	507
DY763293	4	272
DY763291	200	400

############ Get_Seq_Print.r ################
library("primerTree") # install this if it is not. 

in1 <-"Gert.genebank.txt". # this is your input files 
con  <- file(in1, open = "r")
printf <- function(...) cat(sprintf(...))		
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  #print(oneLine)
  fields = strsplit(oneLine, '\t') [[1]]
  # testing
  #print(c(fields[1], fields[2], fields[3]))
  
  printf("%s %s %s\n", fields[1], fields[2], fields[3])
  tag <- toString(fields[1])
  print(tag)
  # Using get_sequence 
  s2  <- get_sequence(tag, start =fields[2], stop =fields[3])
  p2  <- as.character(s2)
  out <- lapply(p2, function(x) paste0(x, collapse = ''))
  print(out)
} 
close(con)


