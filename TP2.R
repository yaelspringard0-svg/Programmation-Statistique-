## Exercice 1

#1
df =read.csv("fao.csv", sep=";", dec = ",", header = TRUE )
View(df)
class(df)
#2
dim(df) # Il y a 186 pays
nrow(df) 
#3
summary(df)


## Exercice 2

#1
mean(df$Dispo_alim, na.rm =TRUE) #si TRUE = fais le calcul sans les valeurs manquantes
#2
sum(df$Population, na.rm = TRUE)
#3
sd(df$Export_viande, na.rm = TRUE)
sd(df$Import_viande, na.rm = TRUE)
#4
median(df$Prod_viande, na.rm = TRUE)
#5
quantile(df$Dispo_alim) # Découpe en 5 parties
#6
quantile(df$Import_viande, probs = seq(0,1,1/100), na.rm = TRUE)


## Exercice 3

#1
ex1 = order(df$Population, na.last = TRUE, decreasing = FALSE )
r1 = head(df[ex1,], n=5)
View(r1)
#2
ex2 = order(df$Population, decreasing = TRUE)
r2 = head(df[ex2,], n=5)
View(r2) 
#3
ex3 = order(df$Prod_viande, decreasing = TRUE)
r3 = head(df[ex3,], n=5)
dim(ex3)
class(ex3)
View(r3)
#4
ex4 = order(df$Import_viande, decreasing = TRUE)
r4 = head(df[ex4,], n=5)
View(r4)
#5 
ex5 = subset(df,Dispo_alim>=2300 ) # Filtrage avec subset
View(ex5)
nrow(ex5)
#6
ex6 = subset(df,Dispo_alim>3500 & Import_viande > 1000 )
View(ex6)
#7
ex7 = subset(df,Nom == "Belgique" | Nom == "France")
View(ex7)
    # OU
resultat = subset(df, Nom %in% c("France","Belgique"))
View(resultat)


## Exercice 4- Modifier le dataframe

#1
df$Part_export = df$Export_viande/df$Prod_viande
View(df)
#2
df$Dispo_alim_pays = df$Dispo_alim*df$Population
View(df)
#3
write.table(df,file = "ExportTp2.csv", append = FALSE, 
            quote = TRUE, sep = ";", eol = "\n", na = "NA", dec = ".",
            row.names = TRUE, col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
    #OU SIMPLEMENT 
write.table(x = df, file = "ExportTp2.csv")
#4
dispo_alim_mondiale=sum(df$Dispo_alim_pays, na.rm = TRUE)
dispo_alim_mondiale
#5
Nbr_adulte=dispo_alim_mondiale/2300
Nbr_adulte


## Exercice 5- Corrélation

#1
plot(x=df$Prod_viande, y=df$Export_viande, main = "Pays : Prod_viande / Export_viande")
#2
cor(x = df$Prod_viande,y = df$Export_viande,    use = "complete.obs") 
    # Pour calculer cor() avec des valeurs manquantes !!
#3
matriceCor= cor(df[,-1], use = "complete.obs")
matriceCor= round(matriceCor,2)
View(matriceCor)
#4
install.packages("corrplot")
rownames(installed.packages()) ## Connaitre tous les noms des packages installés
#5
library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(matriceCor)
