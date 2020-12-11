def isfloat(n):
    try:
        float(n)
    except:
        return False
    return True

rf = open('Thresholds.txt', 'r')
line = rf.readline()
cutoff = []
while line != '':
    line = line.split()
    if isfloat(line[0]): 
        cutoff.append(round(float(line[0]),3))
    line = rf.readline()
rf.close()

rf = open('Test_RF_Prob.txt', 'r')
wf = open('Test_RF_Prob_Predicted.txt', 'w')
line = rf.readline()
while line != '':
    line = line.strip().split('\t')
    if line[0] == 'Sample_ID':
        wf.write('\t'.join(line) + '\t' + 'RF16' + '\t' + 'TMB_10' + '\n')
    else:
        if int(line[1]) == 0:
            if float(line[-2]) >= cutoff[0]:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'NR' + '\n')
            else:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'NR' + '\n')
        elif int(line[1]) == 1:
            if float(line[-2]) >= cutoff[1]:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'NR' + '\n')
            else:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'NR' + '\n')
        elif int(line[1]) == 2:
            if float(line[-2]) >= cutoff[2]:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'R' + '\t' + 'NR' + '\n')
            else:
                if float(line[-3]) >= float(10):
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'R' + '\n')
                else:
                    wf.write('\t'.join(line) + '\t' + 'NR' + '\t' + 'NR' + '\n')
    line = rf.readline()
rf.close()
wf.close()


def evaluation(input, target):
    for i in range(3):
        rf = open(input, 'r')
        line = rf.readline()
        tp=tn=fp=fn=0

        while line != '':
            line = line.strip().split('\t')
            if line[0] != 'Sample_ID':
                if line[1] == str(i):
                    if line[2] == '1':
                        if line[target] == 'R':
                            tp += 1
                        else:
                            fn += 1
                    else:
                        if line[target] == 'R':
                            fp += 1
                        else:
                            tn += 1
            line = rf.readline()
        
        print(str(tn) + '\t' + str(fp) + '\n' + str(fn) + '\t' + str(tp) + '\n')
        sensitivity = float(tp) / (float(tp + fn)) * 100 
        specificity = float(tn) / (float(fp + tn)) * 100
        accuracy = float(tp + tn) / (float(tp + fp + fn + tn)) * 100
        ppv = float(tp) / (float(tp + fp)) * 100
        npv = float(tn) / (float(fn + tn)) * 100
        print(str(sensitivity) + '\t' + str(specificity) + '\t' + str(accuracy) + '\t' + str(ppv) + '\t' + str(npv) + '\n')
        rf.close()       

print('Performance evaluation for RF16')
evaluation('Test_RF_Prob_Predicted.txt', -2)

print('Performance evaluation for TMB')
evaluation('Test_RF_Prob_Predicted.txt', -1)











    
