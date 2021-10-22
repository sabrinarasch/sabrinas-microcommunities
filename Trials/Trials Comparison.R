Start <- c(seq(0,100,5), seq(0,50,5))
End <- c(seq(3,103, 5), seq(3,53,5))
Position <- c(seq(4,104,5), seq(4,54,5))
xyz <- c(seq(2,102,5), seq(2,52,5))
abc <- c(letters[1:21], letters[1:11])

Coordinates <- data.frame(Start, End, Position, xyz, abc)
Coordinates$Start <- as.integer(Coordinates$Start)
Coordinates$End <- as.integer(Coordinates$End)
str(Coordinates)





findMatch <- function(i,n){
  tmp <- colSums(t(Coordinates[-(1:i),]) == unlist(Coordinates[i,]))
  tmp <- tmp[tmp > n]
  if(length(tmp) > 0) return(data.table(sample=rownames(Coordinates)[i],duplicate=names(tmp),match=tmp))
  return(NULL)}

tab <- rbindlist(lapply(1:(nrow(Coordinates)-1),findMatch,n=1))


Coordinates[,1]
