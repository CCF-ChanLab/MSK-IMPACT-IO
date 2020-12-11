library(ggplot2)
library(precrec)
library(pROC)

data <- read.table('Test_RF_Prob.txt', header=T, sep='\t')
## Generate ROC and PRC, Pan-cancer
scores1 <- join_scores(data$RF16_prob, data$RF11_prob, data$TMB)
msmdat <- mmdata(scores1, data$Response)
msmdat2 <- mmdata(scores1, data$Response, modnames = c("RF16", "RF11", "TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Generate ROC and PRC, Melanoma
data2 <- data[grep("0", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Generate ROC and PRC, NSCLC
data2 <- data[grep("1", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Generate ROC and PRC, Others
data2 <- data[grep("2", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

