#coding club 2 - troubleshooting and how to find help

#error - seeing a little red x next to the line of the code; also through console

#common error: 1. r or rstudio version old or new - keep up with the latest versions
            # 2. syntax errors: comma, bracket opened
            # 3. using a function R does not recognise - checking if we uploaded the right package - ?functionname (eg. ?filter)

?filter

dplyr::filter

install.packages("newpackage") #installing another package

#function breakdown and debugging - "for" loops - going through debug broswer
#missing objects - checking if spelling of varibles is correct
#if referring to certain varible from an object using dollar sign, the object comes first - Flowering.Plants$taxonGroup
#data not in a right format - graphs might be wrong - ex. using matrices when should be using dataframes (diff types of variables)
    #checking it with head() - preview, str() - checking the type fo each var, summary()

#wrong data distribution in models - when innapropriate distribution type
#R crashed - if r overloaded --> SAVE YOUR SCRIPTS!
#being stucked in a loop of pluses :D ??

library()

CHEATSHEET OF COMMON MISTAKES

#How to find help
#online help! - type questions along with r - stackoverflow or rbloggers, or how to tutorials on youtube
#using help() function or ?function_name

#warnings - use warnings() to see them 


