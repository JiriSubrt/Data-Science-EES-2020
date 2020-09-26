sparrow <- mean(22, 24, 21)
kingfisher <- mean(26, 23, 25)
eagle <- mean(195, 201, 185)
hummingbird <- mean(8, 9, 9)

wingspan_species <- c(sparrow, kingfisher, eagle, hummingbird)
class(wingspan_species)
names(wingspan_species) <- c("Sparrow", 
                             "Kingfisher", 
                             "Eagle", 
                             "Hummingbird")
barplot(wingspan_species, ylab = "Mean wingspan (cm)", xlab = "Bird species", ylim=c(0,250), cex.names= 0.8,col="pink")

