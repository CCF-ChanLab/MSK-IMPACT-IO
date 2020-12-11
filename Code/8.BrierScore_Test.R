library("pec")
data <- read.table("Test_RF_Prob.txt", header=T, sep='\t')

## Brier score for OS, Pan-cancer
f1 <- coxph(Surv(OS_Months,OS_Event)~RF16_prob,data=data,x=TRUE,y=TRUE)
f2 <- coxph(Surv(OS_Months,OS_Event)~RF11_prob,data=data,x=TRUE,y=TRUE)
f3 <- coxph(Surv(OS_Months,OS_Event)~TMB_score,data=data,x=TRUE,y=TRUE)

brier <- pec(list("RF16"=f1, "RF11"=f2, "TMB"=f3),data=data,formula=Surv(OS_Months,OS_Event)~1)
print(brier)
plot(brier,xlim=c(0,50))

## Brier score for OS, Melanoma
data2 <- data[grep("0", data$Cancer_Type),]
f1 <- coxph(Surv(OS_Months,OS_Event)~RF16_prob,data=data2,x=TRUE,y=TRUE)
f2 <- coxph(Surv(OS_Months,OS_Event)~RF11_prob,data=data2,x=TRUE,y=TRUE)
f3 <- coxph(Surv(OS_Months,OS_Event)~TMB_score,data=data2,x=TRUE,y=TRUE)

brier <- pec(list("RF16"=f1, "RF11"=f2, "TMB"=f3),data=data2,formula=Surv(OS_Months,OS_Event)~1)
print(brier)
plot(brier,xlim=c(0,50))

## Brier score for OS, NSCLC
data2 <- data[grep("1", data$Cancer_Type),]
f1 <- coxph(Surv(OS_Months,OS_Event)~RF16_prob,data=data2,x=TRUE,y=TRUE)
f2 <- coxph(Surv(OS_Months,OS_Event)~RF11_prob,data=data2,x=TRUE,y=TRUE)
f3 <- coxph(Surv(OS_Months,OS_Event)~TMB_score,data=data2,x=TRUE,y=TRUE)

brier <- pec(list("RF16"=f1, "RF11"=f2, "TMB"=f3),data=data2,formula=Surv(OS_Months,OS_Event)~1)
print(brier)
plot(brier,xlim=c(0,50))

## Brier score for OS, Others
data2 <- data[grep("2", data$Cancer_Type),]
f1 <- coxph(Surv(OS_Months,OS_Event)~RF16_prob,data=data2,x=TRUE,y=TRUE)
f2 <- coxph(Surv(OS_Months,OS_Event)~RF11_prob,data=data2,x=TRUE,y=TRUE)
f3 <- coxph(Surv(OS_Months,OS_Event)~TMB,data=data2,x=TRUE,y=TRUE)

brier <- pec(list("RF16"=f1, "RF11"=f2, "TMB"=f3),data=data2,formula=Surv(OS_Months,OS_Event)~1)
print(brier)
plot(brier,xlim=c(0,50))
