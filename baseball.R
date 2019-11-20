install.packages("rvest")
install.packages("stringr")
install.packages("tidyr")
install.packages("data.table")
install.packages("tidyverse")
library(rvest)
library(stringr)
library(tidyr)
library(data.table)
library(tidyverse)
url <- "http://www.statiz.co.kr/stat.php?mid=stat&re=2&ys=2019&ye=2019&se=0&te=&tm=&ty=0&qu=auto&po=0&as=&ae=&hi=&un=&pl=&da=1&o1=ERR&o2=OC&de=1&lr=0&tr=&cv=&ml=1&sn=100&si=&cn="
url1<- "http://www.statiz.co.kr/stat.php?mid=stat&re=2&ys=2019&ye=2019&se=0&te=&tm=&ty=0&qu=auto&po=6&as=&ae=&hi=&un=&pl=&da=1&o1=ERR&o2=OC&de=1&lr=0&tr=&cv=&ml=1&sn=30&si=&cn="

baseball=function(page_url){
  webpage<-xml2::read_html(page_url)
  table<-rvest::html_nodes(x=webpage,xpath='//*[@id="mytable"]')
  td<-table%>%html_nodes("td")
  text<-td%>%html_text()
  df<-as.data.frame(matrix(text,nrow=24,ncol=100)) #데이터프레임 지정
  df.transpose<-as.data.frame(t(as.matrix(df))) #전치
  } #2019년 전체 선수들의 수비수치 (실책 순위 정렬)

yes<-baseball(url)
colnames(yes)= c("sequence","name","team","error","enter","starting","inning","opportunity","suicide","assist","error1","defensive rate","RF9","RNG","ARM","CS","BLK","E+","RAA","/133","POSADJ","RAAwithADJ","WAAw/oADJ","WAAwithADJ")
rownames(yes)= c(1:100) #행과 열 이름지정
head(yes)
str(yes)

baseball2=function(page_url){
  webpage<-xml2::read_html(page_url)
  table<-rvest::html_nodes(x=webpage,xpath='//*[@id="mytable"]')
  td<-table%>%html_nodes("td")
  text<-td%>%html_text()
  df<-as.data.frame(matrix(text,nrow=24,ncol=30)) #데이터프레임 지정
  df.transpose<-as.data.frame(t(as.matrix(df))) #전치
} #2019년 유격수의 수비수치(실책 순위 정렬)
  
no<-baseball2(url1)
colnames(no)= c("sequence","name","team","error","enter","starting","inning","opportunity","suicide","assist","error1","defensive rate","RF9","RNG","ARM","CS","BLK","E+","RAA","/133","POSADJ","RAAwithADJ","WAAw/oADJ","WAAwithADJ")
rownames(no)= c(1:30) #행과 열 이름지정
str(no)
head(no)

