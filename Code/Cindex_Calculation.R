library("survcomp")
data <- read.table("data.txt", header=T, sep='\t')

#C-index for OS, Pan-cancer
c1 <- concordance.index(x=-data$RF16_prob, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
c2 <- concordance.index(x=-data$RF11_prob, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
c3 <- concordance.index(x=-data$TMB, surv.time=data$OS_Months, surv.event=data$OS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for PFS, Pan-cancer
c1 <- concordance.index(x=-data$RF16_prob, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
c2 <- concordance.index(x=-data$RF11_prob, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
c3 <- concordance.index(x=-data$TMB, surv.time=data$PFS_Months, surv.event=data$PFS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for OS, Melanoma
data2 <- data[grep("Melanoma", data$Cancer_Type2),]
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for PFS, Melanoma
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for OS, NSCLC
data2 <- data[grep("NSCLC", data$Cancer_Type2),]
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for PFS, NSCLC
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for OS, Others
data2 <- data[grep("Others", data$Cancer_Type2),]
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$OS_Months, surv.event=data2$OS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)

#C-index for PFS, Others
c1 <- concordance.index(x=-data2$RF16_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c2 <- concordance.index(x=-data2$RF11_prob, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
c3 <- concordance.index(x=-data2$TMB, surv.time=data2$PFS_Months, surv.event=data2$PFS_Event, method="noether")
cindex.comp(c1, c2)
cindex.comp(c1, c3)
cindex.comp(c2, c3)