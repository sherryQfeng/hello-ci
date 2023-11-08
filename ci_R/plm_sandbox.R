# Loading packages
knitr::opts_chunk$set(echo = TRUE, eval=TRUE, message=FALSE, warning=FALSE, fig.height=4)
necessaryPackages <- c("plm","foreign","reshape","rvest","tidyverse","dplyr",
                       "stringr","ggplot2","stargazer","readr","haven","Synth",
                       "devtools","SCtools","augsynth","synthdid")
new.packages <- necessaryPackages[
  !(necessaryPackages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(necessaryPackages, require, character.only = TRUE)

if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")
devtools::install_github("synth-inference/synthdid")
devtools::install_github("bcastanho/SCtools")
devtools::install_github("ebenmichael/augsynth")



# Load data in the plm package
library("plm")

data("EmplUK", package = "plm")
data("Produc", package = "plm")
data("Grunfeld", package = "plm")
data("Wages", package = "plm")

E <- pdata.frame(EmplUK, index = c("firm", "year"), drop.index = TRUE, row.names = TRUE)
# head(E)
# head(attr(E, "index"))
summary(E$emp)
head(lag(E$emp, 1L))

help("lag.plm")






