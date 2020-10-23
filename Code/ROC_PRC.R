library(ggplot2)
library(precrec)
library(pROC)

data <- read.table('data.txt', header=T, sep='\t')
## Generate ROC and PRC, Pan-cancer
scores1 <- join_scores(data$RF16_prob,data$RF11_prob,data$TMB)
msmdat <- mmdata(scores1, data$Response)
msmdat2 <- mmdata(scores1, data$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Pan-cancer
prob_roc <- roc(data$Response, data$RF16_prob)
par(pty="s")
plot.roc(prob_roc, print.thres.best.method="youden", col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

## Generate ROC and PRC, Melanoma
data2 <- data[grep("Melanoma", data2$Cancer_Type2),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Melanoma
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc, print.thres.best.method="youden", col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

## Generate ROC and PRC, NSCLC
data2 <- data[grep("NSCLC", data2$Cancer_Type2),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, NSCLC
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc, print.thres.best.method="youden", col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

## Generate ROC and PRC, Others
data2 <- data[grep("Others", data2$Cancer_Type2),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Others
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc, print.thres.best.method="youden", col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 
