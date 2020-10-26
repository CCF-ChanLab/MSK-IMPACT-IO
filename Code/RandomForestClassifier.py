import csv
import pandas as pd
from sklearn.ensemble import RandomForestClassifier

data_train = pd.read_excel('Data.xlsx', sheet_name='Training')
data_test = pd.read_excel('Data.xlsx', sheet_name='Test')

y_train = pd.DataFrame(data_train, columns=["Response"])
y_test = pd.DataFrame(data_test, columns=["Response"])

### RF16
rf16=["Cancer_Type2", "Albumin", "HED", "TMB", "FCNA", "BMI", "NLR", "Platelets", "HGB","Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI","Sex"]
x_train = pd.DataFrame(data_train, columns=rf16)
x_test = pd.DataFrame(data_test, columns=rf16)

## Run random forest classifier
forest = RandomForestClassifier(min_samples_split=2, n_estimators=1000, max_depth=8, min_samples_leaf=20, random_state = 0, n_jobs = -1)
forest.fit(x_train, y_train.values.ravel())
forest_predict = forest.predict(x_test)

## Save response probability of each sample
with open('Training_RF16_Prob.txt', 'w', newline='') as wf:
    writer = csv.writer(wf, delimiter='\t')
    writer.writerows(zip(data_train['SAMPLE_ID'], forest.predict_proba(x_train)[:,1]))
with open('Test_RF16_Prob.txt', 'w', newline='') as wf:
    writer = csv.writer(wf, delimiter='\t')
    writer.writerows(zip(data_test['SAMPLE_ID'], forest.predict_proba(x_test)[:,1]))

## Feature importance of RF16
print("\nRF16_feature Importance")
for i,j in zip(rf16,list(forest.feature_importances_)):
    print(i,j)
    
### RF11
rf11=["HED", "TMB", "FCNA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI","Sex"]
x_train = pd.DataFrame(data_train, columns=rf11)
x_test = pd.DataFrame(data_test, columns=rf11)

## Run random forest classifier
forest = RandomForestClassifier(min_samples_split=2, n_estimators=300, max_depth=4, min_samples_leaf=12, random_state = 0, n_jobs = -1)
forest.fit(x_train, y_train.values.ravel())
forest_predict = forest.predict(x_test)

## Save response probability of each sample
with open('Training_RF11_Prob.txt', 'w', newline='') as wf:
    writer = csv.writer(wf, delimiter='\t')
    writer.writerows(zip(data_train['SAMPLE_ID'], forest.predict_proba(x_train)[:,1]))
with open('Test_RF11_Prob.txt', 'w', newline='') as wf:
    writer = csv.writer(wf, delimiter='\t')
    writer.writerows(zip(data_test['SAMPLE_ID'], forest.predict_proba(x_test)[:,1]))

## Feature importance of RF11
print("\nRF11_feature Importance")
for i,j in zip(rf11,list(forest.feature_importances_)):
    print(i,j)
