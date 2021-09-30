Untitled
================
Jingyun Jia
Sept 20, 2021

``` r
library(stringr)
library(xml2)
library(XML)
library(RCurl)
library(rvest)
library(dplyr)
```

    ## 
    ## 载入程辑包：'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
faculty_inf=data.frame()
web=read_html("https://guide.wisc.edu/faculty/")
l=3789## the amount of faculty
name=web%>%html_nodes(xpath="//ul[@class='uw-people']/li/p/text()[1]")%>%html_text()
position=web%>%html_nodes(xpath="//ul[@class='uw-people']/li/p/text()[2]")%>%html_text()
major=web%>%html_nodes(xpath="//ul[@class='uw-people']/li/p/text()[3]")%>%html_text()
degree=html_node(html_nodes(web,xpath="//*[@id='textcontainer']/ul/li/p"),xpath='text()[4]')%>%html_text()##to add missing value as NA, or the length of this vector will be 3736.
info=cbind(name,position,major,degree)
head(info)
```

    ##      name                   position                major                    
    ## [1,] "ABBOTT,DAVID H."      "Professor"             "Obstetrics & Gynecology"
    ## [2,] "ABD-ELSAYED,ALAA A"   "Assoc Professor (Chs)" "Anesthesiology"         
    ## [3,] "ABDUALLAH,FAISAL"     "Professor"             "Art"                    
    ## [4,] "ABRAHAM,OLUFUNMILOLA" "Assistant Professor"   "Pharmacy"               
    ## [5,] "ABRAMS,SAMANTHA"      "Assoc Lecturer"        "Information School"     
    ## [6,] "ABRAMSON,LYN"         "Professor"             "Psychology"             
    ##      degree                               
    ## [1,] "PHD 1979 University of Edinburgh"   
    ## [2,] "MD 2000 University of Assiut"       
    ## [3,] "PHD 2012 Royal College of Art"      
    ## [4,] "PHD 2013 Univ of Wisconsin-Madison" 
    ## [5,] "MA 2017 Univ of Wisconsin-Madison"  
    ## [6,] "PHD 1978 University of Pennsylvania"
