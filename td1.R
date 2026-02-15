## TD n°1

# Exercice 1- Les Objets et les Vecteurs 
#1
a = 10
b = 5
#2
resultat = a*b
print(resultat)
#3
A = 7.2
B = 10.1
# Le langage R est sensible à la casse (majuscule/minuscule) car nous avons 4 objets a,b,A et B
#4
resultat = A + B
#La précédente valeur de l'object resultat a été supprimée et remplacée par la somme de A et B
#5
rm(a,b,A,B,resultat)
# OU 
rm(list = ls())
# ls() renvoie le liste de tous les objets présents en mémoire


## Exercice 2- Fonctions Usuelles 
#1
v1 = c(seq(1,5)) #c() est inutile içi 
v1.2 = c(1:5) #c() est inutile içi 
v1.3 = c(1, 2, 3, 4, 5)
class(v1)
class(v1.2)
class(v1.3)
v1[3]
v1.2[3]
v1.3[3]
#1.2
v1.4 = seq(1,5)
v1.5 = 1:5
# Si l'expression produit déjà un vecteur, c() est inutile

#2
v2 = v1 + 3
#3
v3 = 1:6
#4
v4 = v3**2
# OU
v4 = v3^2
#5
v5 = v4/2
#6
jours = c("Lundi", "Mardi", "Mercredi","Juedi", "Vendredi", "Samedi", "Dimanche")
print(jours)
class(jours)
jours[c(2,7)]
#7  Valeurs Booléennes 
v6 = c(TRUE, FALSE, TRUE, FALSE, TRUE)
class(v6)
#8
v7 = c(1.2, 3.54, 16.0)
class(v7)
v7[-3]
#9
mois = c("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Décembre")
class(mois)
mois[1:3]
#10
v8 = c(-12, -64, -9, -534)
class(v8)
Dernier = length(v8)
v8[c(Dernier, 1)]
#11
fruit = c("Pomme", "Poire", "Peche", "Fraise", "Framboise", "Banane", "Ananas")
class(fruit)
fruit[c(-1,-2)]
fruit[-c(1,2)]
fruit[-(1:2)]
#12 Valeurs Manquantes 
v9 = c(20,NA,13,7,NA,16,74)
class(v9)


## Les Fonctions c(), seq(), length()
#1
s1=seq(1,10)
length(s1)
#2
s2=seq(2,20,2)
length(s2)
#3
s3=seq(0,-5)
length(s3)
#4
s4=seq(from= 5,to =50,by= 5)
length(s4)
#5
s5=seq(10,1)
length(s5)
#6
s6=seq(0,1,0.1)
length(s6)
#7
s7=seq(5,-5,-1)
length(s7)
#8
s8=seq(1,10,2)
length(s8)

## Les fonctions c(), rep()
#1
r1 = rep(3,times=5)
#2
r2 = rep(c("A","B","C"), times=3)
print(r2)
#3
r3 = rep(1:3, 3)
#4
r4=rep(c(TRUE,FALSE),4)
print(r4)
#5
rm(list = ls())



# Exercice 3 -Fonctions Statistique Univariées et Simulation 
  # Les Fonctions runif(), mean(), median(), min(), mx()
#1  Nombres Améatoires
v1 = runif(5, min=0, max=5)
print(v1)
mean(v1)
median(v1)
min(v1)
max(v1)
#2
v2 = runif(10, min=-5, max=5)
print(v2)
mean(v2)
median(v2)
min(v2)
max(v2)
#3 Loi Uniforme
v3 = runif(100, min = 10, max = 20)
print(v3)
#4
v4 = runif(15, min = 50, max = 100)
print(v4)

  #Les fonctions rnorm(), mean(), sd(), hist(), quantile()
#1  Distribution Normale 
e1 = rnorm(20, mean=-2, sd=3)
moyenne=mean(e1)
ecart_type=sd(e1)
print(paste("Moyenne : ", moyenne))
print(paste("Écart-type : ", ecart_type))
# paste() sert à coller du texte et des valeurs pour former une phrase, print() sert à afficher cette phrase dans la console
hist(e1)
#2
e2 = rnorm(2000,mean = -2,sd = 3)
moyenne=mean(e2)
ecart_type=sd(e2)
print(paste("Moyenne : ",moyenne))
print(paste("Écart-type : ", ecart_type))
hist(e2)
#3
e3 = rnorm(2000,mean=0,sd=1)
moyenne=mean(e3)
ecart_type=sd(e3)
print(paste("Moyenne : ",moyenne))
print(paste("Écart-type : ", ecart_type))
hist(e3)
#4
quantile(e3)
quantile(e3, probs = c(0.25))
quantile(e3, probs = c(0.50))
quantile(e3, probs = c(0.75))
#5 Déciles !!!!
quantile(e3, probs = seq(0,1,0.1))
#6 Ceniles
quantile(e3, probs = seq(0,1,0.01))

  #Les fonctions sum(), round()
#1
e1 = rnorm(3000,mean=2400,sd=300)
mean(e1)
sd(e1)
#2
e1 = round(e1,2)
#3
masse_salariale=sum(e1)
print(masse_salariale)
#4
median(e1)
#5
quantile(e1,probs=0.99)
# Interprétation = 99% des salaires sont inférieures ou égales à 3101.64
#6
quantile(e1,probs=0.20)
# Interprétation = 20% des salaires sont inférieures ou égales à 2141.576

  #Les fonctions sample(), table(), prop.table(), unique(), sort()
#1
sample(x= c(1,2,3,4,5,6),size= 1)
#2
simulation = sample(x=c(1,2,3,4,5,6),size=12, replace = TRUE)
# Replace = TRUE, tirage avec remise
print(simulation)                    
#3
unique(simulation)
#4
apparation=table(simulation)
apparation2=sort(apparation)
#5
proportion = prop.table(apparation2)
print(proportion)
#6
simulation2=sample(x=c(1,2,3,4,5,6), size = 100000, replace = TRUE)
apparation3=table(simulation2)
print(apparation3)
frequence=prop.table(apparation3)
sort(frequence, decreasing = TRUE)
