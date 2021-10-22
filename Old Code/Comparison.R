setwd("C:/Users/sabri/OneDrive/Desktop/HS21/Bachelor thesis/First Data")

comparison <- read.delim(file = "alltogether_modified.lst.comparison.txt", sep = " " , header = FALSE)
comparison$V22 <- NULL
str(comparison)

library(dplyr)

Duplicates <- duplicated(comparison)
Unique <- unique(comparison)
Distinct <- distinct(comparison)

write.csv(Distinct, file="distinct.txt")


trial <- Distinct[2:3]
str(trial)


findMatch <- function(i,n){
  tmp <- colSums(t(trial[-(1:i),]) == unlist(trial[i,]))
  tmp <- tmp[tmp > n]
  if(length(tmp) > 0) return(data.table(sample=rownames(trial)[i],duplicate=names(tmp),match=tmp))
  return(NULL)}


library(data.table)
#tab <- rbindlist(lapply(1:(nrow(trial)-1),findMatch,n=1))


