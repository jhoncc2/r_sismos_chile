import numpy as np
import pandas as pd

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV

pruebas= ["5_7d", "6_7d", "7_7d", "5_14d", "5_7d_desh"]

for p in pruebas:
    print(type(p))
    X= pd.read_csv("X" + p + ".csv");
    y= pd.read_csv("y" + p + ".csv");

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.33, random_state=9, stratify=y)

    clf= DecisionTreeClassifier()

    clf.fit(X_train, y_train)

    y_pred= clf.predict(X_test)
    print("Accuracy en test set:", accuracy_score(y_test, y_pred))

    print(classification_report(y_test, y_pred))


    print("Batería de tests")
    print()

    tuned_parameters = {'criterion': ['gini','entropy'], 'max_depth': [1,3,5]} #Completar tuned_parameters

    #Repetir el codigo de la seccion anterior con KNN pero ahora con decision tree
    score = 'precision'

    #Construir aca el clf con GridSearch y luego entrenar
    clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=5,
                           scoring=score)
    clf.fit(X_train, y_train)

    print("Mejor combinación de parámetros:")
    print(clf.best_params_)
     
    y_true, y_pred = y_test, clf.predict(X_test)
    print(classification_report(y_true, y_pred))

    print()
    print("###################") 
    print()

