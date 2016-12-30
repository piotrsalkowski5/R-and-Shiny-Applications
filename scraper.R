library(rvest)
library(stringr)
kontener<-data.frame()

for (a in 2:25) {
  
  url1<-"http://www.goldenline.pl/praca/szukaj"
  url2<-"?locations=warszawa&branches%5B0%5D=15"
  u1<-paste(url1,a,sep = "")
  url<-paste(u1,url2,sep="")
  
  
  link <- read_html(url)
  
  
  h<-html_nodes(link,'li [property="jobLocation"]')
  dane<-html_text(h)
  dane
  dane<-str_trim(dane)
  dane

  for (i in 1:length(dane)) {
    kontener[i+(29*(a-2)),3]<-dane[i]
  }
}


write.csv(kontener, file = "MyData.csv",row.names=FALSE)

MyData <- read.csv(file="C:/PIOTREK/MyData.csv", header=TRUE, sep=",")

kontener[,1]




