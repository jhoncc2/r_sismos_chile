import numpy as np
import pandas as pd

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV


pruebas= ["5_7d", "6_7d", "7_7d", "5_14d", "5_7d_desh"]

testSismos = 'F:\\Documentos\\Informática\\Maestria - 01 Primer Semestre\\cc5206 - Introducción a la Minería de Datos\\Proyecto - hito 2\\r_sismos_chile\\src\\hito2\\SismosClasificador.csv'
data = pd.read_csv(testSismos)  # abrimos el archivo csv y lo cargamos en data.
names = list(data)
for name in names:
    if "Unnamed" in name:
        data.pop(name)

X = data[['Depth', 'Magnitude', 'Region_Arica_Parinacota', 'Region_Tarapaca', 'Region_Antofagasta', 'Region_Atacama',
 'Region_Coquimbo', 'Region_Valparaiso', 'Region_Metropolitana_Santiago', 'Region_Libertador_General_OHiggins', 'Region_Maule',
 'Region_Nuble', 'Region_Biobio', 'Region_Araucania', 'Region_Rios', 'Region_Lagos', 'Region_Aysen_General_Carlos_Ibanez',
 'Region_Magallanes_Antartica']]      ## datos, caracteristicas o features de cada ¿Sismo?. 
y = data['class']    ## ¿clase? para cada instancia anterior.

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.33, random_state=9, stratify=y)

tuned_parameters = {'criterion': ['gini','entropy'], 'max_depth': [1,3,5]}
score = 'precision'
clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=5, scoring=score)
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
clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=5, scoring=score)
clf.fit(X_train, y_train)
print("#####################################################") 
print("Mejor combinación de parámetros para atributo " + score)
print(clf.best_params_)
y_true, y_pred = y_test, clf.predict(X_test)
print(classification_report(y_true, y_pred))
print()
print("#####################################################") 
print()

score = 'recall'
clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters, cv=5, scoring=score)
clf.fit(X_train, y_train)
print("#####################################################") 
print("Mejor combinación de parámetros para atributo " + score)
print(clf.best_params_)
y_true, y_pred = y_test, clf.predict(X_test)
print(classification_report(y_true, y_pred))
print()
print("#####################################################") 
print()