import csv
import pandas as pd
from sklearn.ensemble import RandomForestClassifier

data_train = pd.read_excel('Data.xlsx', sheet_name='Training_80')
data_test = pd.read_excel('Data.xlsx', sheet_name='Test_20')

y_train = pd.DataFrame(data_train, columns=["Responder"])
y_test = pd.DataFrame(data_test, columns=["Responder"])

### RF16
rf16=["Cancer_Type2", "Albumin", "HED", "TMB", "FGA", "BMI", "NLR", "Platelets", "HGB","Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI","Sex"]
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
    writer.writerows(zip(data_test['SAMPLE_ID'], forest.predict_proba(x_train)[:,1]))
print("Feature Importance of RF16: \n{}".format(forest.feature_importances_))


### RF11
rf11=["HED", "TMB", "FGA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI","Sex"]
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
    writer.writerows(zip(data_test['SAMPLE_ID'], forest.predict_proba(x_train)[:,1]))
print("Feature Importance of RF11: \n{}".format(forest.feature_importances_))

