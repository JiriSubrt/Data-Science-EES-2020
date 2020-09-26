sparrow <- mean(22, 24, 21)
kingfisher <- mean(26, 23, 25)
eagle <- mean(195, 201, 185)
hummingbird <- mean(8, 9, 9)

#create vector for means and for species

wingspan_species <- c(sparrow, kingfisher, eagle, hummingbird)

bird_species <- c("sparrow", "kingfisher", "eagle", "hummingbird")
class(bird_species)
bird_species <- as.factor(bird_species)
class(bird_species)

#making a dataframe

bird_species_df <- data.frame(bird_species, wingspan_species)
bird_species_df

barplot(bird_species_df$wingspan_species, names.arg = c("sparrow",   #calling out the all wingspan column
                                                        "kingfisher", 
                                                        "eagle", 
                                                        "hummingbird"), 
        ylab = "Mean wingspan (cm)", xlab = "Species", ylim=c(0,250), cex.names= 0.8,col="pink")


