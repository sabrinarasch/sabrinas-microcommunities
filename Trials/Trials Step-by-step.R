library(dplyr)
library(data.table)


Start <- c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
End <- c(9, 19, 28, 36, 45, 56, 67, 78, 89, 99, 111)
id <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
Organism <- c("Rene", "Roman", "Roman", "Sabrina", "Sabrina", "Rene", "Sabrina", "Roman", "Rene", "Sabrina", "Rene")

Coordinates <- data.frame(Start, End, id, Organism)
Coordinates$Start <- as.integer(Coordinates$Start)
Coordinates$End <- as.integer(Coordinates$End)
#str(Coordinates)

Position <- c(8, 28, 28, 46, 65, 33, 88, 15)
Microbe <- c("Rene", "Sabrina", "Rene", "Roman", "Rene", "Sabrina", "Rene", "Roman")

Position <- data.frame(Microbe, Position)
Position$Position <- as.integer(Position$Position)

#Coordinates.start <- Coordinates %>% distinct(Start, .keep_all = TRUE)
#Coordinates.start.end <- Coordinates %>% distinct(Start, End, .keep_all = TRUE)
#Coordinates.start.end.name.t <- Coordinates %>% distinct(Start, End, name, .keep_all = TRUE)





Coordinates <- distinct(Coordinates)
Position <- distinct(Position)



setDT(Coordinates); setDT(Position) # converting to data.table in place

Result <- Position[Coordinates, on = .(Microbe = Organism, Position >= Start, Position < End), nomatch = 0,
      .(x.Position, Start, End, Microbe, Organism)]


Result <- Result %>% arrange(x.Position)





Start <- c(0, 10, 20, 31, 40, 50, 60, 70, 80, 90, 100, 0, 10, 20, 30, 40)
End <- c(9, 18, 28, 36, 45, 56, 67, 78, 89, 99, 111, 9, 19, 28, 36, 45)
id <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 1, 2, 3, 4, 5)
Organism <- c("Rene", "Roman", "Roman", "Sabrina", "Sabrina", "Rene", "Sabrina", "Roman", "Rene", "Sabrina", "Rene", "Rene", "Roman", "Sabrina", "Sabrina", "Rene")

Coordinates <- data.frame(Start, End, id, Organism)
Coordinates$Start <- as.integer(Coordinates$Start)
Coordinates$End <- as.integer(Coordinates$End)
#str(Coordinates)




Coordinates$dupsta <- duplicated(Coordinates$Start)
Coordinates$dupend <- duplicated(Coordinates$End)

Cor <- subset(Coordinates, Coordinates$dupsta == TRUE)
Cor <- subset(Cor, Cor$dupend == TRUE)





#Coordinates$start.smaller <- Position[1,1] > Coordinates[,1]
#Coordinates$end.smaller <- Position[1,1] < Coordinates[,2]
#Coordinates$Result <- Coordinates$start.smaller == Coordinates$end.smaller
#Result <- subset(Coordinates, Coordinates$Result == TRUE)
#View(Result)

#str(Coordinates)
#str(Position)


#for (x in Position$Position) {
#  start.smaller <- x > Coordinates$Start
#  end.smaller <- x < Coordinates$End
#  output = start.smaller == end.smaller
#  Coordinates = cbind(Coordinates, output)
#  colnames(Coordinates)[ncol(Coordinates)] <- paste0("Result", x)
#}

#for (x in 5:ncol(Coordinates)){
#  x <- Coordinates[,x]
#  print(Coordinates[(which(x == TRUE)),])
#  }

#Coordinates[(which(Coordinates$Result2 == TRUE)),]
#Coordinates[(which(Coordinates$Result2, arr.ind = FALSE, useNames = TRUE)),]





#for (i in Position$Position) for(j in Coordinates$Start){
#  if (i > j){
#    for (h in Coordinates$End){
#      if (i<h){
#      Coordinates[Coordinates$Start == TRUE,] }
#      else {
#      print("no")}
#    }
#  }
#  else {
#    print("non")
#  }
#}


#Coordinates[Coordinates$Start == TRUE,]











