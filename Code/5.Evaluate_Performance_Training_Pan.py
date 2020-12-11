## Evaluate model performance using pan-cancer threshold

def isfloat(n):
    try:
        float(n)
    except:
        return False
    return True

rf = open('Pan_Thresholds.txt', 'r')
line = rf.readline()
cutoff = []
while line != '':
    line = line.split()
    if isfloat(line[0]): 
        cutoff.append(round(float(line[0]),3))
    line = rf.readline()
rf.close()

rf = open('Training_RF_Prob.txt', 'r')
wf = open('Training_RF_Prob_Pan_Predicted.txt', 'w')
line = rf.readline()
while line != '':
    line = line.strip().split('\t')
    if line[0] == 'Sample_ID':
        wf.write('\t'.join(line) + '\t' + 'RF16' + '\n')
    else:
        if float(line[-2]) >= cutoff[0]:
            wf.write('\t'.join(line) + '\t' + 'R' + '\n')
        else:
            wf.write('\t'.join(line) + '\t' + 'NR'  + '\n')
    line = rf.readline()
rf.close()
wf.close()

print('<Performance evaluation for RF16 using pan-cancer threshold>')
order = ['Melanoma', 'NSCLC', 'Others']
tp_p=tn_p=fp_p=fn_p=0
for i in range(3):
    rf = open('Training_RF_Prob_Pan_Predicted.txt', 'r')
    line = rf.readline()
    tp=tn=fp=fn=0
    while line != '':
        line = line.strip().split('\t')
        if line[0] != 'Sample_ID':
            if line[1] == str(i):
                if line[2] == '1':
                    if line[-1] == 'R':
                        tp += 1
                        tp_p += 1                         
                    else:
                        fn += 1
                        fn_p += 1
                else:
                    if line[-1] == 'R':
                        fp += 1
                        fp_p += 1 
                    else:
                        tn += 1
                        tn_p += 1
        line = rf.readline()
    print(order[i])
    print(str(tn) + '\t' + str(fp) + '\n' + str(fn) + '\t' + str(tp) + '\n')
    sensitivity = float(tp) / (float(tp + fn)) * 100 
    specificity = float(tn) / (float(fp + tn)) * 100
    accuracy = float(tp + tn) / (float(tp + fp + fn + tn)) * 100
    ppv = float(tp) / (float(tp + fp)) * 100
    npv = float(tn) / (float(fn + tn)) * 100
    print(str(sensitivity) + '\t' + str(specificity) + '\t' + str(accuracy) + '\t' + str(ppv) + '\t' + str(npv) + '\n')
    rf.close()
print('Pan-cancer')
print(str(tn_p) + '\t' + str(fp_p) + '\n' + str(fn_p) + '\t' + str(tp_p) + '\n')
sensitivity_p = float(tp_p) / (float(tp_p + fn_p)) * 100 
specificity_p = float(tn_p) / (float(fp_p + tn_p)) * 100
accuracy_p = float(tp_p + tn_p) / (float(tp_p + fp_p + fn_p + tn_p)) * 100
ppv_p = float(tp_p) / (float(tp_p + fp_p)) * 100
npv_p = float(tn_p) / (float(fn_p + tn_p)) * 100
print(str(sensitivity_p) + '\t' + str(specificity_p) + '\t' + str(accuracy_p) + '\t' + str(ppv_p) + '\t' + str(npv_p) + '\n')













    
