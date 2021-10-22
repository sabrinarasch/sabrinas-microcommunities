SNP <- read.delim(file = "allSNPs_w_gene_position_spaced.tsv", sep = " ", header = FALSE)
Pos <- read.csv(file = "Result_sorted.csv")
Pos <- fixed_dist

setDT(SNP); setDT(Pos)
ResultSNP <- Pos[SNP, on = .(Position = V3), nomatch = 0,
                     .(x.Position, V3, Microbe, V2, V5, Replicate, V1, Ref, Alt, V4, V6, V7, V8, V9, V10, V11)]



SNP01 <- subset(ResultSNP, ResultSNP$x.Position == 83654)
SNP02 <- subset(ResultSNP, ResultSNP$x.Position == 677536)
SNP03 <- subset(ResultSNP, ResultSNP$x.Position == 703340)
SNP04 <- subset(ResultSNP, ResultSNP$x.Position == 1372439)
SNP05 <- subset(ResultSNP, ResultSNP$x.Position == 2351899)
SNP06 <- subset(ResultSNP, ResultSNP$x.Position == 2863371)

SNP07 <- subset(ResultSNP, ResultSNP$x.Position == 555455)

SNP08 <- subset(ResultSNP, ResultSNP$x.Position == 181352)

SNP09 <- subset(ResultSNP, ResultSNP$x.Position == 574130)
SNP10 <- subset(ResultSNP, ResultSNP$x.Position == 574142)
SNP11 <- subset(ResultSNP, ResultSNP$x.Position == 3711132)
SNP12 <- subset(ResultSNP, ResultSNP$x.Position == 4436504)
SNP13 <- subset(ResultSNP, ResultSNP$x.Position == 5466537)
SNP14 <- subset(ResultSNP, ResultSNP$x.Position == 5466552)
SNP15 <- subset(ResultSNP, ResultSNP$x.Position == 5466695)
SNP16 <- subset(ResultSNP, ResultSNP$x.Position == 5466897)
SNP17 <- subset(ResultSNP, ResultSNP$x.Position == 5466905)
SNP18 <- subset(ResultSNP, ResultSNP$x.Position == 5643748)

SNP19 <- subset(ResultSNP, ResultSNP$x.Position == 699272)
SNP20 <- subset(ResultSNP, ResultSNP$x.Position == 1281972)
SNP21 <- subset(ResultSNP, ResultSNP$x.Position == 1628511)
SNP22 <- subset(ResultSNP, ResultSNP$x.Position == 2587322)
SNP23 <- subset(ResultSNP, ResultSNP$x.Position == 3643534)

SNP24 <- subset(ResultSNP, ResultSNP$x.Position == 1584485)

SNP25 <- subset(ResultSNP, ResultSNP$x.Position == 2116572)

