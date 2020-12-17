```R
library(dplyr)
library(stringr)
library(tidyverse)
```
```R
scc <- readRDS("C:/Users/Katya/Desktop/exdata_data_NEI_data/Source_Classification_Code.rds")
nei <-  readRDS("C:/Users/Katya/Desktop/exdata_data_NEI_data/summarySCC_PM25.rds")
```

```R
emitions_per_year <- aggregate(nei$Emissions, by=list(nei$year), sum)
emitions_per_year$x <- emitions_per_year$x/1000

names(emitions_per_year) <- c("Year of research", "Amount of P2.5 in thousand tons")

png("C:/Users/Katya/Desktop/plot7-1.png", width=480, height=480)
plot(emitions_per_year, type='b', col='green', main = "Amount of P2.5  1999 to 2008 years")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7-1.png)


Як бачимо, кількість викидів PM2.5 у США стабільно знижується з 1990 по 2008 роки. 
```R
nei_baltimor <- subset(nei, nei$fips=="24510")

emitions_per_year_baltica <- aggregate(nei_baltimor$Emissions, by=list(nei_baltimor$year), sum)
emitions_per_year_baltica$x = emitions_per_year_baltica$x/1000
names(emitions_per_year_baltica) <- c("Year of research", "Amount of P2.5 in thousand tons")

png("C:/Users/Katya/Desktop/plot7-2.png", width=480, height=480)
plot(emitions_per_year_baltica, type='b', col='green', main = "Amount of P2.5 in Baltimor, USA")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7-2.png)


Викиди в Балтіморі, США також знизилися. Проте, спостерігаємо знайчний сплеск викидів у 2005 році.

```R
baltimor_type <- nei%>%subset(fips=="24510")%>% group_by(year, type)%>% summarise(all=sum(Emissions))

png("C:/Users/Katya/Desktop/plot7-3.png", width=480, height=480)
ggplot(baltimor_type, aes(x=year, y=all, col=type)) + geom_line()
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7-3.png)

Рівень викидів знизився практично для усіх типів вимірювань (окрім типу POINT). Також, логічно що біля дороги викидів трохи менше. 

```R
combined <- merge(scc, nei, by.x = "SCC", by.y = "SCC")
combined$Short.Name

needed <- subset(combined, grepl("(Comb)(.)+(Coal)", combined $Short.Name))
needed_by_year <- aggregate(needed$Emissions,by=list(needed$year),sum)

names(needed_by_year) <- c("Year", "Coal Polution")

png("C:/Users/Katya/Desktop/plot7--4.png", width=480, height=480)
plot(needed_by_year,type='b', col='green', main = "Amount of Coal")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7--4.png)

Забруднення від джерел спалювання вугілля також стрімко знижується - майже наполовину від рівня 1999 року. 
```R
needed2 <- subset(combined, grepl("(Motor)", combined$Short.Name))

needed3 <- subset(needed2, fips=="24510")

final_motor <- aggregate(needed3$Emissions, by=list(needed3$year),sum)

names(final_motor) <- c("Year", "Motor Vehicles Polution")

png("C:/Users/Katya/Desktop/plot7-5.png", width=480, height=480)
plot(final_motor,type='b', col='green', main = "Motor vehicle pollution")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7-5.png)

Забруднення від моторної техніки у Балтиморі стірмко зросло у 2002 році і так само стрімко впало у 2008 році.

```R
nei%>%subset(fips=="24510")%>% group_by(year, type)%>% summarise(all=sum(Emissions))

final_la_bal <- needed2 %>% subset(fips=="06037"|fips=="24510") %>%  group_by(year, fips)%>% summarise(all=sum(Emissions))

png("C:/Users/Katya/Desktop/plot7-6.png", width=480, height=480)
ggplot(final_la_bal, aes(x=year, y=all, col=fips)) + geom_line()
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot7-6.png)

Бачимо, що у Лос_Анжелесі викиди від автомобілів набагато вищі ніж у Балтиморі і поступово зростає. 
