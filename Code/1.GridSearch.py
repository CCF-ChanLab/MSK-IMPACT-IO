import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV

data = pd.read_excel('61971_1_data_set_523545_qkrh1s.xlsx', sheet_name='Training')

params = { 'n_estimators' : list(range(100, 1100, 100)),
           'max_depth' : list(range(2, 22, 2)),
           'min_samples_leaf' : list(range(2, 22, 2)),
           'min_samples_split' : list(range(2, 22, 2))
            }
y_train = pd.DataFrame(data, columns=["Response"])

## GridSearchCV for RF16
rf16=["Cancer_Type2", "Albumin", "HED", "TMB", "FCNA", "BMI", "NLR", "Platelets", "HGB", "Stage", "Age", "Drug", "Chemo_before_IO", "HLA_LOH", "MSI", "Sex"]

x_train = pd.DataFrame(data, columns=rf16)
rf_clf = RandomForestClassifier(random_state = 0, n_jobs = -1)
grid_cv = GridSearchCV(rf_clf, param_grid = params, cv = 5, n_jobs = -1)
grid_cv.fit(x_train, y_train.values.ravel())

print('Optimal Hyper Parameter, RF16: ', grid_cv.best_params_)
print('Maximum Accuracy, RF16: {:.4f}'.format(grid_cv.best_score_))

## GridSearchCV for RF11
rf11=["HED", "TMB", "FCNA", "BMI", "NLR", "Stage", "Age", "Drug", "HLA_LOH", "MSI", "Sex"]

x_train = pd.DataFrame(data, columns=rf11)
rf_clf = RandomForestClassifier(random_state = 0, n_jobs = -1)
grid_cv = GridSearchCV(rf_clf, param_grid = params, cv = 5, n_jobs = -1)
grid_cv.fit(x_train, y_train.values.ravel())

print('Optimal Hyper Parameter, RF11: ', grid_cv.best_params_)
print('Maximum Accuracy, RF11: {:.4f}'.format(grid_cv.best_score_))
