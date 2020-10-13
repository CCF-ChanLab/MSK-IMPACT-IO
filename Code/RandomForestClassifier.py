import pandas as pd
from sklearn import metrics 
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.ensemble import RandomForestClassifier

data_train = pd.read_excel('IMPACT_Training_Test.xlsx', sheet_name='Training_80')
data_test = pd.read_excel('IMPACT_Training_Test.xlsx', sheet_name='Test_20')

### RF16
x_train = pd.DataFrame(data_train, columns=["Cancer_Type2", "Albumin", "HED", "TMB", "FGA", "BMI", "NLR", "Platelets", "HGB","Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI","Sex"])
y_train = pd.DataFrame(data_train, columns=["Response"])
x_test = pd.DataFrame(data_test, columns=["Cancer_Type2","Albumin", "HED", "TMB", "FGA", "BMI", "NLR", "Platelets", "HGB", "Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI","Sex"])
y_test = pd.DataFrame(data_test, columns=["Response"])

## Run random forest classifier
forest = RandomForestClassifier(min_samples_split=2, n_estimators=1000, max_depth=8, min_samples_leaf=20, random_state = 0, n_jobs = -1)
forest.fit(x_train, y_train.values.ravel())
forest_predict = forest.predict(x_test)


## Save response probability of each sample
wf = open('Training_RF16_Prob.txt', 'w')
for i in range(len(forest.predict_proba(x_train)[:,1])):
    wf.write(str(data_train['SAMPLE_ID'][i]) + '\t' + str(forest.predict_proba(x_train)[:,1][i]) + '\n')
wf.close()
wf = open('Test_RF16_Prob.txt', 'w')
for i in range(len(forest.predict_proba(x_test)[:,1])):
    wf.write(str(data_test['SAMPLE_ID'][i]) + '\t' + str(forest.predict_proba(x_test)[:,1][i]) + '\n')
wf.close()

### RF11
x_train = pd.DataFrame(data_train, columns=["HED", "TMB", "FGA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI","Sex"])
y_train = pd.DataFrame(data_train, columns=["Response"])
x_test = pd.DataFrame(data_test, columns=["HED", "TMB", "FGA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI","Sex"])
y_test = pd.DataFrame(data_test, columns=["Response"])

## Run random forest classifier
forest = RandomForestClassifier(min_samples_split=2, n_estimators=1000, max_depth=8, min_samples_leaf=20, random_state = 0, n_jobs = -1)
forest.fit(x_train, y_train.values.ravel())
forest_predict = forest.predict(x_test)


## Save response probability of each sample
wf = open('Training_RF11_Prob.txt', 'w')
for i in range(len(forest.predict_proba(x_train)[:,1])):
    wf.write(str(data_train['SAMPLE_ID'][i]) + '\t' + str(forest.predict_proba(x_train)[:,1][i]) + '\n')
wf.close()
wf = open('Test_RF11_Prob.txt', 'w')
for i in range(len(forest.predict_proba(x_test)[:,1])):
    wf.write(str(data_test['SAMPLE_ID'][i]) + '\t' + str(forest.predict_proba(x_test)[:,1][i]) + '\n')
wf.close()
