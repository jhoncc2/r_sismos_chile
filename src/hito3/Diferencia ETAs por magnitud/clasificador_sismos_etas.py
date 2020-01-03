import numpy as np
import pandas as pd

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV

# Imports para el exportador de árbol
from sklearn.externals.six import StringIO
from IPython.display import Image
from sklearn.tree import export_graphviz
from sklearn import tree
import pydotplus


def exportTreeImage(dtree, X, y, path):
    # Create dot data
    dot_data = tree.export_graphviz(dtree, out_file=None,
            filled=True,
            rounded=True, special_characters=True,
            feature_names=X.columns.tolist(),
            class_names=['Disminución','Aumento'])

    # Draw graph
    graph = pydotplus.graph_from_dot_data(dot_data)

    # Show graph
    Image(graph.create_png())

    # Create PNG
    graph.write_png(path)
    

def entrenarClasificador(prueba, path_X, path_y):
    print("########## Inicio de entrenamiento ###########")
    print(type(prueba))
    print("Leyendo archivo " + path_X)
    X= pd.read_csv(path_X);
    print("Success")
    print("Leyendo archivo " + path_y)
    y= pd.read_csv(path_y);
    print("Succes")
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.33, random_state=9, stratify=y)

    clf= DecisionTreeClassifier()
    clf.fit(X_train, y_train)

    y_pred= clf.predict(X_test)

    print("Accuracy en test set:", accuracy_score(y_test, y_pred))
    print(classification_report(y_test, y_pred))

    print("########### Fin de entrenamiento #############") 
    print("##############################################")

    return clf, X, y, X_train, y_train, X_test, y_test


def main():

    pruebas= ["5_7d", "6_7d", "7_7d", "5_14d", "5_7d_desh"]

    for p in pruebas:
    
        clf, X, y, X_train, y_train, X_test, y_test = entrenarClasificador(p,
                                                "X" + p + ".csv",
                                                "y" + p + ".csv")

        # Supuestamente imprime atributos del árbol
        #print("Atributos del árbol en formato lista:")
        #print(clf.get_params())

        # Exportar árbol
        #exportTreeImage(clf, X, y, p + ".png")

        print("############## Batería de tests ##############")
        print()

        tuned_parameters = {'criterion': ['gini','entropy'], 'max_depth': [1,3,5]} #Completar tuned_parameters

        score = 'precision'
    
        clf = GridSearchCV(DecisionTreeClassifier(), param_grid=tuned_parameters,
                cv=5, scoring=score)
        clf.fit(X_train, y_train)

        print("Mejor combinación de parámetros:")
        print(clf.best_params_)
     
        y_true, y_pred = y_test, clf.predict(X_test)
        print(classification_report(y_true, y_pred))

        print()
        print("########### Fin batería de tests #############") 
        print("##############################################")
        print()

if __name__ == '__main__':
    main()
