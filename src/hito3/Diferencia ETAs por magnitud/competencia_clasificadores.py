## run_classifier recibe un clasificador y un dataset dividido para entrenamiento y testing
## y opcionalmente la cantidad de resultados que se quiere obtener del clasificador

import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import f1_score, recall_score, precision_score


def run_classifier(clf, X, y, num_tests=100):
    metrics = {'f1-score': [], 'precision': [], 'recall': []}
    

    
    for _ in range(num_tests):
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.30)
        clf.fit(X_train, y_train)
        
        predictions = clf.predict(X_test)
        
        metrics['y_pred'] = predictions
        metrics['y_prob'] = clf.predict_proba(X_test)[:,1]
        metrics['f1-score'].append(f1_score(y_test, predictions, average='weighted')) 
        metrics['recall'].append(recall_score(y_test, predictions, average='weighted'))
        metrics['precision'].append(precision_score(y_test, predictions, average='weighted'))
    
    return metrics

import pandas as pd

from sklearn.dummy import DummyClassifier
from sklearn.svm import SVC  # support vector machine classifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB  # naive bayes
from sklearn.neighbors import KNeighborsClassifier


path_X = "X7_14d.csv"
path_y = "y7_14d_cat.csv"

print("Leyendo archivo " + path_X)
X= pd.read_csv(path_X);
print("Success")
print("Leyendo archivo " + path_y)
y= pd.read_csv(path_y);
print("Success")

c0 = ("Base Dummy", DummyClassifier(strategy='stratified'))
c1 = ("Decision Tree", DecisionTreeClassifier())
c2 = ("Gaussian Naive Bayes", GaussianNB())
c3 = ("KNN", KNeighborsClassifier(n_neighbors=5))

classifiers = [c0,c1, c2, c3]

results = {}
for name, clf in classifiers:
    metrics = run_classifier(clf, X, y)   # hay que implementarla en el bloque anterior.
    results[name] = metrics
    print("----------------")
    print("Resultados para clasificador: ",name) 
    print("Precision promedio:",np.array(metrics['precision']).mean())
    print("Recall promedio:",np.array(metrics['recall']).mean())
    print("F1-score promedio:",np.array(metrics['f1-score']).mean())
    print("----------------\n\n")
