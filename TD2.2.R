## TD2

#   EXERCICE 1- Importer des Données
# Les fonctions getwd(), setwd() et read.csv()
#2
getwd()
#"C:/Users/yaels/OneDrive/Documents"
#3
setwd("D:/Programmation Statistique/dataset")
getwd()
#4
bodies_karts = read.csv(file = "bodies_karts (1).csv",header = TRUE,sep = ";", dec = ",")
tires = read.csv(file = "tires (1).csv", header = TRUE, sep = "\t", dec = ",")
gliders = read.csv(file = "gliders (1).csv", header = TRUE, sep = "|", dec = ".")
drivers = read.csv(file = "drivers (1).csv", header = TRUE, sep = ";", dec = ",")
#5
dim(bodies_karts) # lignes, colonnes
dim(tires)
dim(gliders)
dim(drivers)

#   EXERCICE 2- STATISTIQUE
# Les fonctions cor(), corrplot(), install.packages et plot().
#1
summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)
#2
plot(drivers$Weight,drivers$Acceleration, xlab = "Poids", ylab = "Acceleration", main = "Nuage de Point")
#Il semble que les deux variables soient corrélées négativement
# plus le poids augmente, plus l’accélération diminue
#Il y a autant de points mais ils sont superposés car certains drivers ont les mêmes statistiques
#3
correlation = cor(x=drivers$Weight,y=drivers$Acceleration,method = "spearman")
#4
covariance = cov(x=drivers$Weight,y=drivers$Acceleration)
et1=sd(drivers$Weight)
et2=sd(drivers$Acceleration)
correlation2=covariance/(et1*et2)
#5    Coefficient de Détermination (Coefficient de Corrélation puissance 2)
coefdeter = correlation^2
#6  Matrice des Corrélations
matriceCor=round(cor(drivers[,-1]),2)
View(matriceCor)
#Toutes les variables semblent fortement corrélées entre elles
#7  Installation de Package
install.packages("corrplot")
#8 Corrélogramme
library(corrplot)
corrplot(matriceCor, method = "circle",type = "lower",tl.col = "black",
         tl.cex = 0.8)
        #bodies_kart
matriceCor=round(cor(bodies_karts[,-1]),2)
View(matriceCor)
corrplot(matriceCor, method = "circle",type = "lower",tl.col = "black",
         tl.cex = 0.8)
        #tires
matriceCor=round(cor(tires[,-1]),2)
View(matriceCor)
corrplot(matriceCor, method = "circle",type = "lower",tl.col = "black",
         tl.cex = 0.8)
        #gliders
matriceCor=round(cor(gliders[,-c(1)]),2)
View(matriceCor)
corrplot(matriceCor, method = "circle",type = "lower",tl.col = "black",
         tl.cex = 0.8)

# EXAMEN 
col <- colorRampPalette(
  c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")
)
corrplot(
  matriceCor,
  method = "circle",
  col = col(200),
  type = "lower",
  tl.col = "black",
  tl.cex = 0.8
)


#     EXERCICE 3- Manipulation de Data Frame 
#   La fonction order()
#1
resultat = drivers[,c("Driver","Weight")]
#2
resultat = drivers[1:10,c("Driver","Acceleration")]
#3
resultat = drivers[,-c(5,7,9)]
View(resultat)
#4
resultat = drivers[,-c("Weight","Acceleration")] 
# Ca ne marche pas, il faut mettre des indices 
resultat = drivers[,-c(2,3)] 
View(resultat)
#5
resultat[,drivers$Driver,drivers$Acceleration,drivers$Weight]
View(resultat)
dim(resultat)
    # OU
resultat=drivers[,c["Driver","Acceleration","Weight"]]
dim(resultat)
#Les colonnes sont dans l'ordre défini par le vecteur
#6
resultat = drivers[c(32,3,12),]
View(resultat)
#7
resultat = drivers[ c(32,3,12) , ]
View(resultat)
#8   TRI
rang = order(drivers$Weight)
resultat = drivers[rang,c("Driver","Weight")]
View(rang)
View(resultat)
#9
rang = order(drivers$Acceleration, decreasing = TRUE)
resultat =  drivers[rang,c("Driver","Acceleration")]
View(resultat)
#10     Double Tri
rang = order(drivers$Acceleration, drivers$Weight, decreasing = c(TRUE,FALSE))
resultat = drivers[rang,c("Driver","Weight","Acceleration")]
View(resultat)


#     EXERCICE 4- GOAT
#1 
rang = order(drivers$Acceleration, decreasing = TRUE)
topDriver = drivers[rang,c("Driver","Acceleration")]
View(topDriver)
topDriver = topDriver[1:5,]
View(topDriver)
#        OU
help(subset)
topDriver = subset(x = drivers,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Driver","Acceleration"))
View(topDriver)
#2
#TopGlider
help(subset)
topGlider = subset(x = gliders,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Glider","Acceleration"))
View(topGlider)
#TopTires
help(subset)
topTires = subset(x = tires,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Tire","Acceleration"))
View(topTires)
#TopBody
help(subset)
topBody = subset(x = bodies_karts,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Body","Acceleration"))
View(topBody)
