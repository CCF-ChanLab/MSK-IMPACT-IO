library("survcomp")
data <- read.table("Training_RF_Prob.txt", header=T, sep='\t')

#C-index for OS, Pan-cancer
c_rf16 <- concordance.index(x=-data$RF16_prob, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
c_rf11 <- concordance.index(x=-data$RF11_prob, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
c_tmb <- concordance.index(x=-data$TMB, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for PFS, Pan-cancer
c_rf16 <- concordance.index(x=-data$RF16_prob, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
c_rf11 <- concordance.index(x=-data$RF11_prob, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
c_tmb <- concordance.index(x=-data$TMB, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for OS, Melanoma
data2 <- data[grep("0", data$Cancer_Type),]
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for PFS, Melanoma
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for OS, NSCLC
data2 <- data[grep("1", data$Cancer_Type),]
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for PFS, NSCLC
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for OS, Others
data2 <- data[grep("2", data$Cancer_Type),]
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

#C-index for PFS, Others
c_rf16 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_rf11 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c_tmb <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c_rf16, c_rf11)
cindex.comp(c_rf16, c_tmb)
cindex.comp(c_rf11, c_tmb)

