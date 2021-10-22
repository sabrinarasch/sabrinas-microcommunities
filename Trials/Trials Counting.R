fasta_AGTU <- read.delim(file = "alltogether_modified.gen.fasta.AGTU.gen", sep = " ", header = FALSE)

fasta_AGTU$Name <- paste(fasta_AGTU$V7, fasta_AGTU$V8, fasta_AGTU$V9, fasta_AGTU$V10 )


library(dplyr)
fasta_AGTU_tidy <- fasta_AGTU %>% select(1, 2, 3, 4, 5, 6, 11)
names(fasta_AGTU_tidy) <- c("DNA", "Start", "End", "short", "Organism", "UniprotID", "Name" )


a <- ifelse(fasta_AGTU_tidy$DNA == "", rownames(fasta_AGTU_tidy), "")
a <- subset(a, a!="")
a <- as.numeric(a)
c <- a-1
c <- c(c[2:5], nrow(fasta_AGTU_tidy))


#for (x in 2:length(a)-1){
#  b <- a[x]
#  f <- c[x]
#  p <- subset(fasta_AGTU[b:f,])
#  r <- rbind(p)
#  print(r)
#}




fasta_AGTU_sub <- subset(fasta_AGTU_tidy[1:19,])
fasta_AGTU_sub <- subset(fasta_AGTU_tidy[20:49,])
fasta_AGTU_sub <- subset(fasta_AGTU_tidy[50:63,])
fasta_AGTU_sub <- subset(fasta_AGTU_tidy[64:82,])
fasta_AGTU_sub <- subset(fasta_AGTU_tidy[83:89,])

g <- c("")
for (x in fasta_AGTU_sub$DNA) {
  f <- x
  g <- c(g,f)
}
R1_AGTU <- unlist(strsplit(g, split = ""))














#not automatically and not nicely checking if there are mismatches!


fasta_all <- read.delim(file = "alltogether_modified.gen.fasta - not nicely.gen", sep = " ", header = FALSE)

fasta_all$Name <- paste(fasta_all$V7, fasta_all$V8, fasta_all$V9, fasta_all$V10, fasta_all$V11, fasta_all$V12)


library(dplyr)
fasta_all_tidy <- fasta_all %>% select(1, 2, 3, 4, 5, 6, 14)
names(fasta_all_tidy) <- c("DNA", "Start", "End", "short", "Organism", "UniprotID", "Name" )


a <- ifelse(fasta_all_tidy$DNA == "", rownames(fasta_all_tidy), "")
a <- subset(a, a!="")
a <- as.numeric(a)
c <- c(a[2:24]-1, nrow(fasta_all_tidy))


# a:  1  20  50  64  83  90 137 143 166 189 212 238 244 267 290 313 333 358 393 407 421 442 463 484
# c: 19  49  63  82  89 136 142 165 188 211 237 243 266 289 312 332 357 392 406 420 441 462 483 504


fasta_all_sub <- subset(fasta_all_tidy[1:19,])
fasta_all_sub <- subset(fasta_all_tidy[20:49,])
fasta_all_sub <- subset(fasta_all_tidy[50:63,])
fasta_all_sub <- subset(fasta_all_tidy[64:82,])
fasta_all_sub <- subset(fasta_all_tidy[83:89,])

fasta_all_sub <- subset(fasta_all_tidy[90:136,])
fasta_all_sub <- subset(fasta_all_tidy[137:142,])
fasta_all_sub <- subset(fasta_all_tidy[143:165,])
fasta_all_sub <- subset(fasta_all_tidy[166:188,])
fasta_all_sub <- subset(fasta_all_tidy[189:211,])

fasta_all_sub <- subset(fasta_all_tidy[212:237,])
fasta_all_sub <- subset(fasta_all_tidy[238:243,])
fasta_all_sub <- subset(fasta_all_tidy[244:266,])
fasta_all_sub <- subset(fasta_all_tidy[267:289,])
fasta_all_sub <- subset(fasta_all_tidy[290:312,])

fasta_all_sub <- subset(fasta_all_tidy[313:332,])
fasta_all_sub <- subset(fasta_all_tidy[333:357,])
fasta_all_sub <- subset(fasta_all_tidy[358:392,])
fasta_all_sub <- subset(fasta_all_tidy[393:406,])
fasta_all_sub <- subset(fasta_all_tidy[407:420,])

fasta_all_sub <- subset(fasta_all_tidy[421:441,])
fasta_all_sub <- subset(fasta_all_tidy[442:462,])
fasta_all_sub <- subset(fasta_all_tidy[463:483,])
fasta_all_sub <- subset(fasta_all_tidy[484:504,])

g <- c("")
for (x in fasta_all_sub$DNA) {
  f <- x
  g <- c(g,f)
}
R24 <- unlist(strsplit(g, split = ""))



R01[196] #c
R02[887] #T
R03[469] #G
R04[94]  #A
R05[255] #C
R06[1517] #G
R07[72] #T
R08[988] #G
R09[1190] #C
R10[1190] #C
R11[336] #C
R12[131] #A
R13[830] #A
R14[1198] #C
R15[845] #G
R16[403] #T
R17[194] #T
R18[1559] #C
R19[296] #G
R20[272] #A
R21[766] #G
R22[766] #G
R23[766] #G
R24[766] #G




fasta_ref <- c(R01[196], R02[887], R03[469], R04[94], R05[255], R06[1517], R07[72], R08[988], R09[1190], R10[1190], R11[336], R12[131], R13[830], R14[1198], R15[845], R16[403], R17[194], R18[1559], R19[296], R20[272], R21[766], R22[766], R23[766], R24[766])




Result_fasta <- Result_sorted #get this from R script Step-by-step
Result_fasta <- Result_fasta %>% select(1,2,3,4,6,7,8,9,10)

Result_fasta$position <- (Result_fasta$x.Position - Result_fasta$Start) + 1
Result_fasta$nr <- (Result_fasta$End - Result_fasta$Start) + 1

Result_fasta$fasta <- fasta_ref
Result_fasta <- Result_fasta %>% select(1,10,2,3,11,4,5,6,7,12,8,9)


