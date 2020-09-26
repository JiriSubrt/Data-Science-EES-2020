#https://ourcodingclub.github.io/tutorials/intro-to-r/

2+2
#pressing cmd+enter to run a code in script
#always rather write the code to your script, to save it for later - creating a reproductible record, command S saves the file

# Coding Club Workshop 1 - R Basics
# Learning how to import and explore data, and make graphs about Edinburgh's biodiversity
# Written by Gergana Daskalova 06/11/2016 University of Edinburgh

#package is a bundle of commands that can be loaded into R to provide extra functionality

#installing packages
install.packages("package-name")

#loading packages: library(package-name)

#defining workinhg directory

#which working directory am I right now
getwd()

#changing my working directory
#also can use the tab at the top of the screen saying session 
#filepath has to have forward slashes /// (only windows)
setwd("~/Desktop/JIRI_DATA_2020")

install.packages("dplyr")
library(dplyr)

install.packages("tidyverse")
install.packages("dplyr")
library(dplyr)

#IMPORTING AND CHECKING DATA

#importing file using read.csv() or using a tab import dataset in the environment, make sure to select headings as yees if we want first row to be treated as headings 
edidiv <- read.csv("~/Downloads/CC-RBasics-master/edidiv.csv")
#When entering data in Excel, don’t put any spaces in your row names, as they will confuse R later
# If your files are separated by semicolons, use read.csv2 instead of read.csv, or alternatively use the argument “sep” (for separator) in the read.csvfunction: r.csv("your-file-path", sep = ";").

#using arrows <- to assign objects

head(edidiv)                # Displays the first few rows
tail(edidiv)                # Displays the last rows
str(edidiv)                 # Tells you whether the variables are continuous, integers, categorical or characters, important to check always our data

head(edidiv$taxonGroup)     # Displays the first few rows of this column only
class(edidiv$taxonGroup)    # Tells you what type of variable we're dealing with: it's character now but we want it to be a factor

edidiv$taxonGroup <- as.factor(edidiv$taxonGroup)     # What are we doing here?!

#check if this is a variable type we want
is.factor(edidiv$taxonGroup)

class(edidiv$taxonGroup)

dim(edidiv)                 # Displays number of rows and columns
summary(edidiv)             # Gives you a summary of the data
summary(edidiv$taxonGroup)  # Gives you a summary of that particular variable (column) in your dataset

#Calculating species richness

summary(edidiv$taxonGroup)

#using filter() function to split ididiv into multiple objects
Beetle <- filter(edidiv, taxonGroup == "Beetle")
Bird <- filter(edidiv, taxonGroup == "Bird")
Flowering.Plants <- filter(edidiv, taxonGroup == "Flowering.Plants")
Mollusc <- filter(edidiv, taxonGroup == "Mollusc")
Liverwort <- filter(edidiv, taxonGroup == "Liverwort")
Dragonfly <- filter(edidiv, taxonGroup == "Dragonfly")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Butterfly <- filter(edidiv, taxonGroup == "Butterfly")

# unique(), which identifies different species, and length(), which counts them

beetleN <- length(unique(Beetle$taxonName))
beetleN
birdN <- length(unique(Bird$taxonName))
Flowering.PlantsN <- length(unique(Flowering.Plants$taxonName))
Flowering.PlantsN
molluscN <- length(unique(Mollusc$taxonName))
LiverwortN <- length(unique(Liverwort$taxonName))  
DragonflyN <- length(unique(Dragonfly$taxonName))  
FungusN <- length(unique(Fungus$taxonName))
HymenopteranN <- length(unique(Hymenopteran$taxonName))
LichenN <- length(unique(Lichen$taxonName))
MammalN <- length(unique(Mammal$taxonName))
ButterflyN <- length(unique(Butterfly$taxonName))

#CREATING A VECTOR and PLOTTING IT (it has one dimension, as opposed to data frtame with 2)

#using c() - to concentate; using names()

biodiversity <- c(beetleN, birdN, ButterflyN, Flowering.PlantsN, molluscN, LiverwortN, DragonflyN, FungusN, HymenopteranN, LichenN, MammalN)
names(biodiversity) <-c("Beetle",
                        "Bird", 
                        "Butterfly",
                        "Flowering.Plants",
                        "Mollusc",
                        "Liverwort",
                        "Dragonfly",
                        "Fungus",
                        "Hymenopteran",
                        "Lichen",
                        "Mammal")

barplot(biodiversity, ylab = "Number of Species", xlab = "Taxa", ylim=c(0,600), cex.names= 0.8,col="pink")
#using the cex code to increase / decrease the font size

#The final barplot

#DATAFRAME AND PLOTTING IT
#Data frames are tables of values: they have a two-dimensional structure with rows and columns, where each column can have a different data type
#also matrix, but variables must all be the same type

#object taxa with all taxa names
taxa <- c("Beetle",   
           "Bird", 
           "Butterfly",
           "Flowering.Plants",
           "Mollusc",
           "Liverwort",
           "Dragonfly",
           "Fungus",
           "Hymenopteran",
           "Lichen",
           "Mammal")

#converting it to factor so it is all categorical
taxa_f <- factor(taxa)

#combining all values for the number of species
richness <- c(beetleN, birdN, ButterflyN, Flowering.PlantsN, molluscN, LiverwortN, DragonflyN, FungusN, HymenopteranN, LichenN, MammalN)
  
#creating a dataframe from two vectors
biodiversity_data <- data.frame(taxa_f, richness)
biodiversity_data

#saving the data frame
write.csv(biodiversity_data, file="biodiversitydata.csv")

#plotting the data frame 
png("barplot2.png", width=1600, height=600)
barplot(biodiversity_data$richness, names.arg=c("Beetle",   
                                                  "Bird", 
                                                  "Butterfly",
                                                  "Flowering.Plants",
                                                  "Mollusc",
                                                  "Liverwort",
                                                  "Dragonfly",
                                                  "Fungus",
                                                  "Hymenopteran",
                                                  "Lichen",
                                                  "Mammal"),
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))
dev.off()


  