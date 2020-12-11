library(ggplot2)
library(precrec)
library(pROC)

data <- read.table('Training_RF_Prob.txt', header=T, sep='\t')
## Generate ROC and PRC, Pan-cancer
scores1 <- join_scores(data$RF16_prob, data$RF11_prob, data$TMB)
msmdat <- mmdata(scores1, data$Response)
msmdat2 <- mmdata(scores1, data$Response, modnames = c("RF16", "RF11", "TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Pan-cancer
prob_roc <- roc(data$Response, data$RF16_prob)
par(pty="s")
plot.roc(prob_roc, col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

## Generate ROC and PRC, Melanoma
data2 <- data[grep("0", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Melanoma
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc, col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

mel_threshold <- ci.thresholds(prob_roc, thresholds="best")
cat("Melanoma Threshold", file = "Thresholds.txt", append = TRUE)
capture.output(mel_threshold, file = "Thresholds.txt", append = TRUE)

## Generate ROC and PRC, NSCLC
data2 <- data[grep("1", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, NSCLC
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc, col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

nsclc_threshold <- ci.thresholds(prob_roc, thresholds="best")
cat("NSCLC Threshold", file = "Thresholds.txt", append = TRUE)
capture.output(nsclc_threshold, file = "Thresholds.txt", append = TRUE)

## Generate ROC and PRC, Others
data2 <- data[grep("2", data$Cancer_Type),]
scores1 <- join_scores(data2$RF16_prob,data2$RF11_prob,data2$TMB)
msmdat <- mmdata(scores1, data2$Response)
msmdat2 <- mmdata(scores1, data2$Response, modnames = c("RF16","RF11","TMB"))
mscurves <- evalmod(msmdat2)
autoplot(mscurves)
mscurves

## Detect the optimal threshold, Others
prob_roc <- roc(data2$Response, data2$RF16_prob)
par(pty="s")
plot.roc(prob_roc,col="red", print.auc=TRUE, print.auc.adj=c(2,-12),
         max.auc.polygon=TRUE, print.thres=TRUE, print.thres.pch=19, print.thres.col = "red", print.thres.adj=c(0.3,-1.2),
         auc.polygon=TRUE, auc.polygon.col="#D1F2EB",legacy.axes = TRUE)
legend("bottomright", legend=c("RF16"), col=c("red"), lwd=2) 

others_threshold <- ci.thresholds(prob_roc, thresholds="best")
cat("Others Threshold", file = "Thresholds.txt", append = TRUE)
capture.output(others_threshold, file = "Thresholds.txt", append = TRUE)
