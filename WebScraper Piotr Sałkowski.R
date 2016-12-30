library(rvest)
library(stringr)
kontener<-data.frame()

for (a in 2:6) {

  url1<-"http://www.goldenline.pl/praca/szukaj"
  url2<-"?locations=warszawa&branches%5B0%5D=15"
  u1<-paste(url1,a,sep = "")
  url<-paste(u1,url2,sep="")


  link <- read_html(url)


  h<-html_nodes(link,'li .position')
  dane<-html_text(h)


  for (i in 1:length(dane)) {
    kontener[i+(29*(a-2)),1]<-dane[i]
  }
}




for (a in 2:6) {

  url1<-"http://www.goldenline.pl/praca/szukaj"
  url2<-"?locations=warszawa&branches%5B0%5D=15"
  u1<-paste(url1,a,sep = "")
  url<-paste(u1,url2,sep="")


  link <- read_html(url)


  h<-html_nodes(link,'li .company')
  dane<-html_text(h)


  for (i in 1:length(dane)) {
    kontener[i+(29*(a-2)),2]<-dane[i]
  }
}



for (a in 2:6) {

  url1<-"http://www.goldenline.pl/praca/szukaj"
  url2<-"?locations=warszawa&branches%5B0%5D=15"
  u1<-paste(url1,a,sep = "")
  url<-paste(u1,url2,sep="")


  link <- read_html(url)


  h<-html_nodes(link,'li [property="jobLocation"]')
  dane<-html_text(h)
  dane<-str_trim(dane)
  dane


  for (i in 1:length(dane)) {
    kontener[i+(29*(a-2)),3]<-dane[i]
  }
}

a<-sample(4000:12000,145)
a

for (s in 1:145) {
  kontener[s,4]<-a[s]
}



colnames(kontener)<-c("Praca","Firma","Lokalizacja","Wynagrodzenie")

write.csv(kontener, file = "Praca2.csv",row.names=FALSE)

data <- read.csv(file = "C:/PIOTREK/Praca_Dane_R.csv")
kontener
data

