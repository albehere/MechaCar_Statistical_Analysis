library(dplyr)
MechaCar <- read.csv(file ='MechaCar_mpg.csv')
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data=MechaCar))
Mecha_matrix <- as.matrix.data.frame(MechaCar)
cor(Mecha_matrix)
shapiro.test(MechaCar$mpg)
shapiro.test(MechaCar$vehicle_length)
shapiro.test(MechaCar$ground_clearance)
MechaCar <- MechaCar%>% mutate(vehicle_length=log2(vehicle_length))
summary(lm(mpg ~ vehicle_length  + ground_clearance, data=MechaCar))


SusCoil <- read.csv(file = 'Suspension_Coil.csv')
total_summary <- SusCoil %>% summarize(mean(PSI), median(PSI), var(PSI), sd(PSI))
total_summary
lot_summary <- SusCoil %>% group_by(Manufacturing_Lot) %>% summarize(mean(PSI), median(PSI), var(PSI), sd(PSI))
lot_summary

View(total_summary)
View(lot_summary)

t.test(SusCoil$PSI, mu=1500)
t.test(subset(SusCoil$PSI, SusCoil$Manufacturing_Lot == 'Lot1'),mu=1500)
t.test(subset(SusCoil$PSI, SusCoil$Manufacturing_Lot == 'Lot2'),mu=1500)
t.test(subset(SusCoil$PSI, SusCoil$Manufacturing_Lot == 'Lot3'),mu=1500)