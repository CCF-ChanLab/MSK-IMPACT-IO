library("ggplot2")
library("survminer")
library("survival")

data <- read.table('Training_RF_Prob_Predicted.txt', header=T, sep='\t')

#OS analysis for RF16, Pan-cancer
fit <- survfit(Surv(OS_Months, OS_Event) ~ RF16, data = data)
ggsurvplot(fit, data, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data$OS_Months, event = data$OS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data)
summary(coxph_survfit)

#PFS analysis for RF16, Pan-cancer
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ RF16, data = data)
ggsurvplot(fit, data, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data$PFS_Months, event = data$PFS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data)
summary(coxph_survfit)

#OS analysis for TMB, Pan-cancer
fit <- survfit(Surv(OS_Months, OS_Event) ~ TMB_10, data = data)
ggsurvplot(fit, data, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data$OS_Months, event = data$OS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data)
summary(coxph_survfit)

#PFS analysis for TMB, Pan-cancer
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ TMB_10, data = data)
ggsurvplot(fit, data, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data$PFS_Months, event = data$PFS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data)
summary(coxph_survfit)

#OS analysis for RF16, Melanoma
data2 <- data[grep("0", data$Cancer_Type),]
fit <- survfit(Surv(OS_Months, OS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#PFS analysis for RF16, Melanoma
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#OS analysis for TMB, Melanoma
fit <- survfit(Surv(OS_Months, OS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

#PFS analysis for TMB, Melanoma
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

#OS analysis for RF16, NSCLC
data2 <- data[grep("1", data$Cancer_Type),]
fit <- survfit(Surv(OS_Months, OS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#PFS analysis for RF16, NSCLC
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#OS analysis for TMB, NSCLC
fit <- survfit(Surv(OS_Months, OS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

#PFS analysis for TMB, NSCLC
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

#OS analysis for RF16, Others
data2 <- data[grep("2", data$Cancer_Type),]
fit <- survfit(Surv(OS_Months, OS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#PFS analysis for RF16, Others
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ RF16, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ RF16, data = data2)
summary(coxph_survfit)

#OS analysis for TMB, Others
data2 <- data[grep("2", data$Cancer_Type),]
fit <- survfit(Surv(OS_Months, OS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$OS_Months, event = data2$OS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

#PFS analysis for TMB, Others
fit <- survfit(Surv(PFS_Months, PFS_Event) ~ TMB_10, data = data2)
ggsurvplot(fit, data2, pval = TRUE, conf.int = FALSE, palette = c("#2E9FDF", "#E7B800"),
           risk.table = TRUE, risk.table.y.text.col = TRUE, font.legend=13)

surv_object <- Surv(time = data2$PFS_Months, event = data2$PFS_Event)
coxph_survfit <- coxph(surv_object ~ TMB_10, data = data2)
summary(coxph_survfit)

