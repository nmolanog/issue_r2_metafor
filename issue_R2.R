rm(list=ls())
library(here)
library(openxlsx)
library(metafor)
###load data
z0 <- read.csv(file="sample_data.csv", header=TRUE, sep=",")
z0$Individual.type<-factor(z0$Individual.type)

dat <- escalc(measure = "PLO", xi = HPV.total, ni = N.individuals, data = z0,append = T)
m1<-rma.mv(yi, vi, random = ~ 1 | Author, data = dat, mods= ~Individual.type, method = "REML")
m10<-rma.mv(yi, vi, random = ~ 1 | Author, data = dat, method = "REML")

###R2 is negative
(m10$sigma2 - m1$sigma2) / m10$sigma2
