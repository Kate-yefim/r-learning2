#Лабораторна робота 1

# Завдання 1

```
library(readxl)

download_link <- 'https://data.gov.ua/dataset/dd257efd-52ad-4588-b9e3-9940264ab6dc/resource/5ff44cdf-a3fe-4a72-a41b-6fb965057c4e/download/vikonavcirobit
obstegennia_-21-10-2020.xlsx'
path_file <- 'C:/Users/Katya/Desktop/vikonavcirobitobstegennia_-21-10-2020.xlsx'
download.file(download_link, path_file, mode="wb")
head(read_excel(path_file))

  "tibble: 6 x 16
  PrefLabel Identifier1 Address ContactPointHas~ ContactPointHas~ Homepage ExpertsInvolved Identifier2 LaborRelations
  <chr>     <chr>       <chr>   <chr>            <chr>            <chr>    <chr>           <chr>       <chr>         
1 "Наймену~ Ідентифіка~ Місцез~ "Номер телефону~ Електронна адре~ Веб-сайт Прізвище, ім’я~ Серія та н~ "Форма трудов~
2 "ПРИВАТН~ 38945395    33028,~ "(067) 608-53-0~ ivandidula@gmai~ didula.~ Дідула Іван Се~ АЕ № 000831 "основне місц~
3 "ТОВАРИС~ 40846485    65121,~ "(097) 499-08-2~ ukrcentr.od@gma~ ukrcent~ Пащенко Василь~ АЕ № 004308 "основне місц~
4 "ТОВАРИС~ 40502044    65012,~ "(048) 788-82-2~ vstyle.proekt@g~ v-style~ Кушнір Олексій~ АЕ № 004845 "неосновне мі~
5 "ФІЗИЧНА~ 1808303806  74900,~ "(066) 397-51-8~ n_49@ukr.net     null     Найдьонова Нат~ АЕ № 000577 "основне місц~
6 "ТОВАРИС~ 31403145    03680,~ "(044) 333-50-2~ info@undergeo.c~ underge~ Снісаренко Вол~ АЕ № 000773 "основне місц~
# ... with 7 more variables: ScopeOfWork1 <chr>, ScopeOfWork2 <chr>, ScopeOfWork3 <chr>, PriorityArea <chr>,
#   DateOfPublication <chr>, DateOfChange <chr>, DateOfdeletion <chr>"
```
#	Завдання 2

```
download_link <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
file_path <- 'C:/Users/Katya/Desktop/getdata_data_ss06hid.csv'
download.file(download_link, file_path)

table_info <-read.csv(file_path)
nrow(subset(table_info, table_info$VAL==24))
[1] 53
```

#	Завдання 3

```
library("XML")
download_link <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
 parsing<-xmlTreeParse(download_link, useInternal = TRUE)
roots<-xmlRoot(parsing)

zipcodes<-xpathSApply(roots, "//zipcode", xmlValue)
length(which(zipcodes==21231))

[1] 127
```
