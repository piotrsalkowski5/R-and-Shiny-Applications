---
title: "Markdown_Data"
author: "Piotr Sa³kowski"
date: "12 grudnia 2016"
output: html_document
---
WebScraper

```r
# library(rvest)
# library(stringr)
# kontener<-data.frame()
# 
# for (a in 2:6) {
#   
#   url1<-"http://www.goldenline.pl/praca/szukaj"
#   url2<-"?locations=warszawa&branches%5B0%5D=15"
#   u1<-paste(url1,a,sep = "")
#   url<-paste(u1,url2,sep="")
#   
#   
#   link <- read_html(url)
#   
#   
#   h<-html_nodes(link,'li .position')
#   dane<-html_text(h)
#   
#   
#   for (i in 1:length(dane)) {
#     kontener[i+(29*(a-2)),1]<-dane[i]
#   }
# }
# 
# 
# 
# 
# for (a in 2:6) {
#   
#   url1<-"http://www.goldenline.pl/praca/szukaj"
#   url2<-"?locations=warszawa&branches%5B0%5D=15"
#   u1<-paste(url1,a,sep = "")
#   url<-paste(u1,url2,sep="")
#   
#   
#   link <- read_html(url)
#   
#   
#   h<-html_nodes(link,'li .company')
#   dane<-html_text(h)
#   
#   
#   for (i in 1:length(dane)) {
#     kontener[i+(29*(a-2)),2]<-dane[i]
#   }
# }
# 
# 
# 
# for (a in 2:6) {
#   
#   url1<-"http://www.goldenline.pl/praca/szukaj"
#   url2<-"?locations=warszawa&branches%5B0%5D=15"
#   u1<-paste(url1,a,sep = "")
#   url<-paste(u1,url2,sep="")
#   
#   
#   link <- read_html(url)
#   
#   
#   h<-html_nodes(link,'li [property="jobLocation"]')
#   dane<-html_text(h)
#   dane<-str_trim(dane)
#   dane
#   
#   
#   for (i in 1:length(dane)) {
#     kontener[i+(29*(a-2)),3]<-dane[i]
#   }
# }
# 
# a<-sample(4000:12000,145)
# a
# 
# for (s in 1:145) {
#   kontener[s,4]<-a[s]
# }
# 
# 
# 
# colnames(kontener)<-c("Praca","Firma","Lokalizacja","Wynagrodzenie")
# 
# write.csv(kontener, file = "Praca2.csv",row.names=FALSE)
# kontener
```






Pobranie danych z Pliku CSV

```r
MyData <- read.csv(file="C:/PIOTREK/Praca_Dane_R.csv", header=TRUE, sep=",")
head(MyData[,1],10)
```

```
##  [1] Junior PHP Developer                                 
##  [2] Test Engineer                                        
##  [3] ETL Developer                                        
##  [4] Programista systemu ERP - IFS - modu³ kadrowo-p³acowy
##  [5] Specjalista modu³owy SAP                             
##  [6] Junior Front-end Java Developer                      
##  [7] SAP Business Analyst                                 
##  [8] SAP BW Support Consultant                            
##  [9] Technical Customer Support with FRENCH and ITALIAN   
## [10] Technical Customer Support with GERMAN               
## 125 Levels: .NET   Umbraco Developer ... Web Content Specialist
```

```r
head(MyData[,2],10)
```

```
##  [1] G-Force Sp. z o.o.                   
##  [2] IT KONTRAKT Sp. z o.o.               
##  [3] Sii Sp. z o.o.                       
##  [4] TeamQuest Sp. z o.o.                 
##  [5] Polkomtel Sp. z o. o.                
##  [6] GRAFTON RECRUITMENT POLSKA SP. Z O.O.
##  [7] GRAFTON RECRUITMENT POLSKA SP. Z O.O.
##  [8] GRAFTON RECRUITMENT POLSKA SP. Z O.O.
##  [9] GRAFTON RECRUITMENT POLSKA SP. Z O.O.
## [10] GRAFTON RECRUITMENT POLSKA SP. Z O.O.
## 29 Levels: ACCENTURE SP. Z O.O. Antal International ... TeamQuest Sp. z o.o.
```

```r
head(MyData[,3],10)
```

```
##  [1] Lublin   Warszawa Lublin   Warszawa Warszawa Warszawa Lublin  
##  [8] Warszawa Opole    Opole   
## Levels: Kraków Lublin Opole Warszawa Wejherowo Wroc³aw
```

```r
head(MyData[,4],10)
```

```
##  [1]  5905 10263  7817  6880  5521 10033  7537 11736  7661  4138
```
Pokazanie Podsumowania Danych zawartych w pliku CSV, zapisanego z Data.Frame, z pobranego zbioru danych ze strony www.goldenline.pl


```r
summary(MyData[1])
```

```
##                                                   Praca    
##  Key Account Manager                                 :  5  
##  Kierownik produkcji                                 :  5  
##  Kierownik Sklepu                                    :  5  
##  Specjalista ds. ryzyka - ubezpieczenia komunikacyjne:  5  
##  .NET Developer                                      :  3  
##  Java Developer                                      :  2  
##  (Other)                                             :120
```

```r
summary(MyData[2])
```

```
##                                    Firma   
##  Hays Poland Sp. z o.o.               :29  
##  GRAFTON RECRUITMENT POLSKA SP. Z O.O.:19  
##  TeamQuest Sp. z o.o.                 :11  
##  ACCENTURE SP. Z O.O.                 : 9  
##  Sii Sp. z o.o.                       : 9  
##  Antal International                  : 6  
##  (Other)                              :62
```

```r
summary(MyData[3])
```

```
##     Lokalizacja
##  Kraków   :16  
##  Lublin   : 5  
##  Opole    :20  
##  Warszawa :85  
##  Wejherowo:10  
##  Wroc³aw  : 9
```

```r
summary(MyData[4])
```

```
##  Wynagrodzenie  
##  Min.   : 4045  
##  1st Qu.: 5601  
##  Median : 7523  
##  Mean   : 7750  
##  3rd Qu.: 9986  
##  Max.   :11996
```

Wykresy


```r
library(png)


ima <- readPNG("C:\\ekipa.png")
```

```
## Error in readPNG("C:\\ekipa.png"): unable to open C:\ekipa.png
```

```r
hist(x=MyData[,4],xlab = "Wynagrodzenie",ylab = "Czêstotliwoœæ",
     main = "Histogram - Wynagrodzenie")

lim <- par()
rasterImage(ima, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
```

```
## Error in rasterImage(ima, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4]): object 'ima' not found
```

```r
grid()
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)




