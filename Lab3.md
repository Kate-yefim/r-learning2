```R
library("xml2")
library("rvest")
library(stringr)
```
```R
download_file <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_ty")
download_file

{html_document}
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script type ...
[2] <body id="styleguide-v2" class="fixed">\n            <img height="1" width="1" style="dis .
```
```R
rank_all <- html_nodes(download_file,  '.text-primary')
rank_all 
{xml_nodeset (100)}
 [1] <span class="lister-item-index unbold text-primary">1.</span>
 [2] <span class="lister-item-index unbold text-primary">2.</span>
 [3] <span class="lister-item-index unbold text-primary">3.</span>
 [4] <span class="lister-item-index unbold text-primary">4.</span>
 [5] <span class="lister-item-index unbold text-primary">5.</span>

rank_w <- html_text(rank_all) 
rank_w
 [1] "1."   "2."   "3."   "4."   "5."   "6."   "7."   "8."   "9."   "10."  "11."  "12."  "13." 
 [14] "14."  "15."  "16."  "17."  "18."  "19."  "20."  "21."  "22."  "23."  "24."  "25."  "26." 
 [27] "27."  "28."  "29."  "30."  "31."  "32."  "33."  "34."  "35."  "36."  "37."  "38."  "39." 
 [40] "40."  "41."  "42."  "43."  "44."  "45."  "46."  "47."  "48."  "49."  "50."  "51."  "52." 
 [53] "53."  "54."  "55."  "56."  "57."  "58."  "59."  "60."  "61."  "62."  "63."  "64."  "65." 
 [66] "66."  "67."  "68."  "69."  "70."  "71."  "72."  "73."  "74."  "75."  "76."  "77."  "78." 
 [79] "79."  "80."  "81."  "82."  "83."  "84."  "85."  "86."  "87."  "88."  "89."  "90."  "91." 
 [92] "92."  "93."  "94."  "95."  "96."  "97."  "98."  "99."  "100."

rank_data <- as.numeric(rank_w)
rank_data

[1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22
 [23]  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44
 [45]  45  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66
 [67]  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88
 [89]  89  90  91  92  93  94  95  96  97  98  99 100
```

```R
title_all <- html_nodes(download_file,  '.lister-item-header a')
title_data <- html_text(title_all)

title_all
title_data

{xml_nodeset (100)}
 [1] <a href="/title/tt5171438/?ref_=adv_li_tt">Зоряний шлях: Дискавері</a>
 [2] <a href="/title/tt6524350/?ref_=adv_li_tt">Великий Рот</a>
 [3] <a href="/title/tt6470478/?ref_=adv_li_tt">Гарний лікар</a>
 [4] <a href="/title/tt6473344/?ref_=adv_li_tt">SEAL Team</a>
 [5] <a href="/title/tt5071412/?ref_=adv_li_tt">Озарк</a>
 
 [1] "Зоряний шлях: Дискавері"                  "Великий Рот"                             
  [3] "Гарний лікар"                             "SEAL Team"                               
  [5] "Озарк"                                    "Паперовий будинок"                       
  [7] "Оповідь служниці"                         "Пітьма"                                  
  [9] "Велика маленька брехня"                   "Юний Шелдон"                             
 [11] "Мисливець за розумом"                     "Дуже погані матусі 2"                    
 [13] "Американські боги"                        "Диво-жінка"  
```

```R
runtime_all <- html_nodes(downhtml_textload_file,  '.text-muted .runtime')
runtime_w <- html_text(runtime_all, trim=T)
runtime_data <- as.numeric(str_remove(runtime_w, 'min'))

runtime_all
runtime_w
runtime_data

 [1] <span class="runtime">60 min</span>
 [2] <span class="runtime">30 min</span>
 [3] <span class="runtime">41 min</span>
 [4] <span class="runtime">43 min</span>
 [5] <span class="runtime">60 min</span>
 [6] <span class="runtime">70 min</span>
 
 [1] "60 min"  "30 min"  "41 min"  "43 min"  "60 min"  "70 min"  "60 min"  "60 min"  "60 min" 
 [10] "30 min"  "60 min"  "104 min" "60 min"  "141 min" "164 min" "45 min"  "57 min"  "43 min" 
 [19] "53 min"  "105 min" "452 min" "136 min" "45 min"  "116 min" "130 min" "135 min" "106 min"
 [28] "60 min"  "120 min" "113 min" "132 min" "152 min" "133 min" "59 min"  "104 min" "60 min" 
 [37] "137 min" "44 min"  "129 min" "60 min"  "25 min"  "60 min"  "123 min" "105 min" "113 min"
 
  [1]  60  30  41  43  60  70  60  60  60  30  60 104  60 141 164  45  57  43  53 105 452 136
 [23]  45 116 130 135 106  60 120 113 132 152 133  59 104  60 137  44 129  60  25  60 123 105
 [45] 113  42  60  30 115  60 140  21  60 114 119  60 122  30 121 133  60 102 129 136  94  92
 [67]  35 141  45 109 154  50 122  23  45 107 126  85 108  51 107 115 124  60 134  30 118  92
 [89]  60  84 119  50 121  55 130 120 104 125  43 118
 
```
```R
movies <- data.frame(rank_data, title_data, runtime_data, stringsAsFactors = FALSE)
movies

  rank_data                               title_data runtime_data
1           1                  Зоряний шлях: Дискавері           60
2           2                              Великий Рот           30
3           3                             Гарний лікар           41
4           4                                SEAL Team           43
5           5                                    Озарк           60
6           6                        Паперовий будинок           70

head(movies$title_data)

[1] "Зоряний шлях: Дискавері" "Великий Рот"             "Гарний лікар"           
[4] "SEAL Team"               "Озарк"                   "Паперовий будинок"    

subset(movies$title_data, runtime_data >120)

 [1] "Диво-жінка"                               "Той, хто біжить по лезу 2049"            
 [3] "Знебожені"                                "Вартові Галактики 2"                     
 [5] "Тор: Раґнарок"                            "Воно"                                    
 [7] "Назви мене своїм ім'ям"                   "Зоряні війни: Епізод 8 - Останні Джедаї" 
 [9] "Людина-павук: Повернення додому"          "Логан: Росомаха"                         
[11] "Красуня і Чудовисько"                     "Форма води"                              
[13] "Гра Моллі"                                "Чужий: Заповіт"                          
[15] "Вбивство священного оленя"                "Метелик"                                 
[17] "Пірати Карибського моря: Помста Салазара" "Валеріан і місто тисячі планет"          
[19] "Kingsman: Золоте кільце"                  "Трансформери: Останній лицар"            
[21] "Джон Вік 2"                               "Король Артур: Легенда меча"              
[23] "Saban's Могутні рейнджери"                "Вороги"                                  
[25] "Мати!"                                    "Примарна нитка"                          
[27] "Темні часи"  

length(subset(movies$title_data, runtime_data <100))
[1] 50
```
