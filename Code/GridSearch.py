import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV

data = pd.read_excel('Data.xlsx', sheet_name='Training')

params = { 'n_estimators' : list(range(100, 1100, 100)),
           'max_depth' : list(range(2, 22, 2)),
           'min_samples_leaf' : list(range(2, 22, 2)),
           'min_samples_split' : list(range(2, 22, 2))
            }
y_train = pd.DataFrame(data, columns=["Response"])

## GridSearchCV for RF16
rf16=["Cancer_Type2", "Albumin", "HED", "TMB", "FCNA", "BMI", "NLR", "Platelets", "HGB", "Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI", "Sex"]

x_train = pd.DataFrame(data, columns=rf16)
rfc = RandomForestClassifier(random_state = 0, n_jobs = -1)
rfc_cv = GridSearchCV(rfc, param_grid = params, cv = 5, n_jobs = -1)
rfc_cv.fit(x_train, y_train.values.ravel())

print('Optimal Hyper Parameter, RF16: ', rfc_cv.best_params_)
print('Maximum Accuracy, RF16: {:.4f}'.format(rfc_cv.best_score_))

## GridSearchCV for RF11
rf11=["HED", "TMB", "FCNA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI", "Sex"]

x_train = pd.DataFrame(data, columns=rf11)
rfc = RandomForestClassifier(random_state = 0, n_jobs = -1)
rfc_cv = GridSearchCV(rfc, param_grid = params, cv = 5, n_jobs = -1)
rfc_cv.fit(x_train, y_train.values.ravel())

print('Optimal Hyper Parameter, RF11: ', rfc_cv.best_params_)
print('Maximum Accuracy, RF11: {:.4f}'.format(rfc_cv.best_score_))
