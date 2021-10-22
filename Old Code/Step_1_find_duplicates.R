#Step-by-step: The plot shows the fixed mutations over time and the list of those 41 SNPs with their coordinates and the specie/replicon (FixedMutations_OverTime.txt)

#Step 1) Based on the file alltogether_modified.lst.txt (with Genes coordinates and their function) --> Find which genes the SNPs are belonging to ?

#Step 2) Based on the gene fasta sequence (alltogether_modified.gen.fasta): BLAST the sequence of hypothetical proteins to see if a similar sequence is present in other microbes and try to infer a function by sequence similarity (and % of sequence similarity)

#Step 3) Based on the Protein sequence (alltogether_modified.prt): define the consequence of the SNP: synonymous or nonsynonymous ? Calculate dN/dS (if applicable, because few SNPs but the code can be ready for more data)







#Step 1)
#In file "alltogether_modified.lst" mannually (in VSC) find "|" and replace with "space", so that import is a data.frame, add several spaces at the end of the first row so that there is enough space for all words (because the Proteins do not have the same nr. of words)

#to Source file location
setwd("C:/Users/sabri/OneDrive/Desktop/HS21/Bachelor thesis/First Data")

#load packages
library(dplyr)
library(data.table)

#import data files
fixed <- read.delim(file = "FixedMutations_OverTime.txt")
all <- read.delim(file = "alltogether_modified.lst.txt", sep = " " , header = FALSE)

#str(all)
#str(fixed)



#look for duplicates and delete them
#all <- distinct(all)
#fixed <- distinct(fixed)

#tidy up data
#all$V1 <- NULL #delet because unnecessary
#all$V4 <- NULL #delet because unnecessary
#all$V5 <- NULL #delet because unnecessary
#all$V6 <- NULL #delet because unnecessary
#all$V7 <- NULL #delet because unnecessary
#all$V9 <- NULL #delet is only Validation
#all$V12 <- NULL #delet is only Validation
#all$V22 <- NULL #delet because shows NA

#all$V13 <- paste(all$V13, all$V14, all$V15, all$V16, all$V17, all$V18, all$V19, all$V20, all$V21)
#all$V14 <- NULL
#all$V15 <- NULL
#all$V16 <- NULL
#all$V17 <- NULL
#all$V18 <- NULL
#all$V19 <- NULL
#all$V20 <- NULL
#all$V21 <- NULL
#names(all) <- c("Start", "End", "short", "Organism", "UniprotID", "Name" )
#names(fixed) <- c("Microbe", "Replicate", "Position", "Ref", "Alt")


#try to find the answer to the question by just manually doing it
#AGTU.c01.all <- subset(all, all$Organism == "AGTU.c01") #first find Genes belonging to AGTU.c01 -> make subset
#AGTU.c01.fixed <- subset(fixed, fixed$Microbe == "AGTU.c01") #find  all SNPs belonging to AGTU.c01 -> make subset
#str(AGTU.c01.fixed)
#str(AGTU.c01.all)

#compare Position to Start and End and find out which is bigger/smaller (only for first SNP of AGTU.c01)
#AGTU.c01.all$start.smaller <- AGTU.c01.fixed[1,3] > AGTU.c01.all$Start 
#AGTU.c01.all$end.smaller <- AGTU.c01.fixed[1,3] < AGTU.c01.all$End 

#look for Gene that the SNP belongs too. if no result the SNP is not in a Gene
#AGTU.c01.all$Result <- AGTU.c01.all$start.smaller == AGTU.c01.all$end.smaller
#Result <- subset(AGTU.c01.all, AGTU.c01.all$Result == TRUE)
#View(Result)


#done automatically for all ATGU.c01 (explanation same as above)
#for (x in AGTU.c01.fixed$Position) {
#  start.smaller <- x > AGTU.c01.all$Start
#  end.smaller <- x < AGTU.c01.all$End 
#  output = start.smaller == end.smaller
#  AGTU.c01.all = cbind(AGTU.c01.all, output)
#  colnames(AGTU.c01.all)[ncol(AGTU.c01.all)] <- paste0("Result", x)
#  for (x in 7:ncol(AGTU.c01.all)){
#    x <- AGTU.c01.all[,x]
#    print(AGTU.c01.all[(which(x == TRUE)),])
#  } #this last for searches each "Result" for a TRUE and gives me the row it is in
#}



#setDT(AGTU.c01.all); setDT(AGTU.c01.fixed) # converting to data.table in place
#ResultAGTU <- AGTU.c01.fixed[AGTU.c01.all, on = .(Position >= Start, Position < End), nomatch = 0,
#         .(x.Position, Start, End, short, Organism, Name)]


#ResultAGTU <- ResultAGTU %>% arrange(x.Position)


#setDT(all); setDT(fixed) # converting to data.table in place
#Result <- fixed[all, on = .(Microbe = Organism, Position >= Start, Position < End), nomatch = 0,
#               .(x.Position, Start, End,  Organism,Microbe, Replicate, Name, short, Ref, Alt, UniprotID)]

#Result <- Result %>% arrange(Organism, Replicate, x.Position)



#tidy up data nicely :)
all_dist <- distinct(all)
fixed_dist <- distinct(fixed)

all_dist_tidy <- all_dist
all_dist_tidy$V22 <- paste(all_dist$V13, all_dist$V14, all_dist$V15, all_dist$V16, all_dist$V17, all_dist$V18, all_dist$V19, all_dist$V20, all_dist$V21)
all_dist_tidy <- all_dist_tidy %>% select(2, 3, 8, 10, 11, 22)

names(all_dist_tidy) <- c("Start", "End", "short", "Organism", "UniprotID", "Name" )
names(fixed_dist) <- c("Microbe", "Replicate", "Position", "Ref", "Alt")

#also looked at duplicates with excel (where you can easily compare only rows) -> found that 19 rows are still duplicated (just have a different name; e.g. "hypothetical protein")
#making a table with these

all_dup <- all_dist_tidy
all_dup$dupsta <- duplicated(all_dup$Start)
all_dup$dupend <- duplicated(all_dup$End)

all_dup_true <- subset(all_dup, all_dup$dupsta == TRUE)
all_dup_true <- subset(all_dup_true, all_dup_true$dupend == TRUE)
names(all_dup_true) <- c("S", "E", "s", "O", "U", "N", "ds", "de")

setDT(all_dup_true)
all_duplicates <- all_dup_true[all_dup, on = .(S = Start, E = End), nomatch = 0,
              .(Start, End,  Organism, Name, short, UniprotID)]

#now write program again with new names of data
setDT(all_dist_tidy); setDT(fixed_dist)
Result <- fixed_dist[all_dist_tidy, on = .(Microbe = Organism, Position >= Start, Position < End), nomatch = 0,
                .(x.Position, Start, End,  Organism,Microbe, Replicate, Name, short, Ref, Alt, UniprotID)]

Result_sorted <- Result %>% arrange(Organism, Replicate, x.Position)



#look if any SNPs are in one of the still duplicated proteins (it's not the case, because then it would also appear in the Result but still to be sure!)
#Result_dup <- fixed_dist[all_duplicates, on = .(Microbe = Organism, Position >= Start, Position < End), nomatch = 0,
#                     .(x.Position, Start, End,  Organism,Microbe, Replicate, Name, short, Ref, Alt, UniprotID)]
#Result_dup_sorted <- Result %>% arrange(Organism, Replicate, x.Position)

Result_hypothetical <- subset(Result_sorted, Result_sorted$Name == "hypothetical protein       ")


tryal <- subset(Result_sorted, Organism == "AGTU.c01")
tryal <- tryal %>% select(1,2,3,4,8,9,10)
tryal$position <- (tryal$x.Position - tryal$Start) + 1
tryal$AA <- tryal$position / 3
tryal$nr <- (tryal$End - tryal$Start) + 1



tryal_all <- Result_sorted
tryal_all <- tryal_all %>% select(1,2,3,4,8,9,10)
tryal_all$position <- (tryal_all$x.Position - tryal_all$Start) + 1
tryal_all$AA <- tryal_all$position / 3
tryal_all$nr <- (tryal_all$End - tryal_all$Start) + 1

