#Importing File
getwd()
setwd("C:/Users/anike/OneDrive/Desktop/SDS 313/Homework 1")
bonds <- read.csv('Homework1_Bonds.csv')
#Question 1
table(bonds$Result)
city <- bonds[bonds$Type == "CITY",]
prop.table(table(city$Result=="Carried"))
county <- bonds[bonds$Type == "COUNTY",]
prop.table(table(county$Result=="Carried"))
isd <- bonds[bonds$Type == "ISD",]
prop.table(table(isd$Result=="Carried"))
wd <- bonds[bonds$Type == "WD",]
prop.table(table(wd$Result=="Carried"))
#Question 2
Votes_Total <- bonds$VotesFor + bonds$VotesAgainst
which.max(Votes_Total)
bonds[1072,]
#Question 3
Carried_Bonds <- bonds[bonds$Result=="Carried" & (bonds$VotesFor + bonds$VotesAgainst)>=100,]
Votes_For <- (Carried_Bonds$VotesFor/(Carried_Bonds$VotesFor+Carried_Bonds$VotesAgainst))*100
hist(Votes_For,main='Histogram of Votes For Ratio in Carried Bonds',xlab='Votes For Ratio'
     ,col='#31a35475', xlim=c(50,100))
mean(Votes_For, na.rm = TRUE)
median(Votes_For, na.rm = TRUE)
sd(Votes_For, na.rm = TRUE)
#Question 4
plot(Votes_For,Carried_Bonds$Amount,main='Ratio of Votes for Bonds vs Cost of Bonds',
     xlab='Votes For Ratio',ylab='Cost of Bonds',pch=20)
cor(Votes_For,Carried_Bonds$Amount)
