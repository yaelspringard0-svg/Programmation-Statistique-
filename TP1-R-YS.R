# TP1

#Exercice 1 - sur les fonctions en R

#1
iris #objet déjà stocké en mémoire, affiche le contenu de iris
      # print(iris) et iris 
class(iris) #dataframe = tableau de données

#2
View(iris)

#3
nrow(iris) #nombre de ligne

#4
ncol(iris) #nombre de colonne

#5
colnames(iris) #nom des colonnes

#6
summary(iris)

#7
iris[,c("Sepal.Length","Species")] #affiche les colonnes dans l'ordre donné

#8
iris[c(100,103,105),]

#9
iris[c(50:100),]
iris[50:100,]

#10
mean(iris$Sepal.Length)

#11
median(iris$Sepal.Length)

#12
sd(iris$Petal.Length)

#13
quantile(iris$Petal.Width,probs = seq(from = 0.1, to = 0.9, by = 0.1))



# Exercice 2- Import/Exporter un dataframe

#1
dfManga = read.csv("C:/Users/yaels/OneDrive/Documents/manga.csv",header=TRUE,sep=",",dec=".")
dfAnime = read.csv("C:/Users/yaels/OneDrive/Documents/anime.csv",header=TRUE,sep=",",dec=".")
class(dfManga)
class(dfAnime)

#2
View(dfManga)
View(dfAnime)

#3
dim(dfManga) #nombre de ligne et colonne
dim(dfAnime)

#4
mean(dfManga$Score)
mean(dfAnime$Score) #Moyenne la plus élevée

#5
sum(dfManga$Vote)
sum(dfAnime$Vote)

#6
sd(dfManga$Score) #Echantillon le plus homogène car sd plus petit
sd(dfAnime$Score)

#7
quantile(dfManga$Score, probs = seq(from=0.1, to=0.9, by=0.1))
quantile(dfAnime$Score, probs = seq(from=0.1, to=0.9, by=0.1))

## Les fonctions subset(), table() et prop.table()
#1
extraction1 = subset(dfManga, Score > 9)
dim(extraction1)
nrow(extraction1)
#2
extraction2 = subset(dfManga,Vote>=200000)
nrow(extraction2)
#3
extraction3 = subset(dfManga,Vote>=200000 & Score>8)
nrow(extraction3)
#4
extraction4 = subset(dfManga,Score>=7 & Score<=8)
nrow(extraction4)

## Filtre sur les Animes 
#1
effectifRating = table(dfAnime$Rating) #calcule les effectifs de chaque modalité de la variable Rating
print(effectifRating)
length(effectifRating) #donne le nombre de modalités de la variable Rating
prop.table(effectifRating) #Calcule les fréquences relatives associées à chaque modalité de la variable
#2
extrac1=subset(dfAnime,Rating=="R - 17+ (violence & profanity)")
nrow(extrac1)
#3
extrac2=subset(dfAnime,Rating=="R - 17+ (violence & profanity)" & Score>=8)
nrow(extrac2)
#4
extrac3=subset(dfAnime,Rating!="R - 17+ (violence & profanity)")
nrow(extrac3)
#5
extrac4=subset(dfAnime,Rating=="PG - Children" | Rating=="G - All Ages")
nrow(extrac4)

extrac5 <- subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(extrac5)
#6
extrac6=subset(dfAnime,Rating!="PG - Children" & Rating!="G - All Ages")
nrow(extrac6)

extrac7 <- subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(extrac7)
#7
extrac8=subset(dfAnime,Score>=9 | Vote>=400000)
nrow(extrac8)

#Les fonctions rbind() et write.table()
#1
dfAnime=dfAnime[,c("Title","Score","Vote","Ranked")]
dfManga=dfManga[,c("Title","Score","Vote","Ranked")]

dfManga=data.frame(Title=dfManga$Title,Score=dfManga$Score,Vote=dfManga$Vote,Ranked=dfManga$Ranked)
#2
dfAnime$Type = "Anime"
dfManga$Type = "Manga"
#3
dfConcat=rbind(dfManga,dfAnime)
View(dfConcat)

#4
getwd()
write.table(x=dfConcat,file = "C:/Users/yaels/OneDrive/Documents/ExportTp1.csv",sep = ";", row.names = FALSE)
