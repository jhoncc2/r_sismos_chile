import numpy as np
import pandas as pd

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from clasificador_sismos_etas_categories import *


pruebas= ["6_7d", "6_14d", "7_7d", "7_14d"]


for p in pruebas:
    
    clf, X, y, X_train, y_train, X_test, y_test = entrenarClasificador(p,
            "X" + p + ".csv", "y" + p + "_cat.csv")
 
    print("#####################################################")
    print("Batería de tests: " + p)
    print()

    tuned_parameters = {'criterion': ['gini','entropy'], 'max_depth': [1,3,5]}

    score = 'precision_micro'
    clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=3,
                           scoring=score)
    clf.fit(X_train, y_train)
    print("#####################################################") 
    print("Mejor combinación de parámetros para atributo " + score)
    print(clf.best_params_)
    y_true, y_pred = y_test, clf.predict(X_test)
    print(classification_report(y_true, y_pred))
    print()
    print("#####################################################") 
    print()


    score = 'accuracy'
    clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=3,
                           scoring=score)
    clf.fit(X_train, y_train)
    print("#####################################################") 
    print("Mejor combinación de parámetros para atributo " + score)
    print(clf.best_params_)
    y_true, y_pred = y_test, clf.predict(X_test)
    print(classification_report(y_true, y_pred))
    print()
    print("#####################################################") 
    print()


    score = 'recall_micro'
    clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=3,
                           scoring=score)
    clf.fit(X_train, y_train)
    print("#####################################################") 
    print("Mejor combinación de parámetros para atributo " + score)
    print(clf.best_params_)
    y_true, y_pred = y_test, clf.predict(X_test)
    print(classification_report(y_true, y_pred))
    print()
    print("#####################################################") 
    print()

