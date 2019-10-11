# Genera los mejores árboles de decisión, de acuerdo a los resultados
# de «competencia_arboles_clasificacion.py»

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
            filled=True, rounded=True, special_characters=True,
            feature_names=X.columns.tolist(),
            class_names=['Disminución','Aumento'])

    # Draw graph
    graph = pydotplus.graph_from_dot_data(dot_data)

    # Show graph
    Image(graph.create_png())

    # Create PNG
    graph.write_png(path)


def generar_arbol(prueba, criterion, max_depth, score):
    X= pd.read_csv("X" + prueba + ".csv");
    y= pd.read_csv("y" + prueba + ".csv");
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.33, random_state=9, stratify=y)

    clf = DecisionTreeClassifier(criterion=criterion, max_depth=max_depth)
    clf.fit(X_train, y_train)

    exportTreeImage(clf, X, y, prueba + score + ".png")


# Optimizado para «precision»
generar_arbol("5_7d", 'gini', 1, 'precision')
generar_arbol("6_7d", 'gini', 3, 'precision')
generar_arbol("7_7d", 'gini', 1, 'precision')


# Optimizado para «accuracy»
generar_arbol("5_7d", 'entropy', 5, 'accuracy')
generar_arbol("6_7d", 'gini', 3, 'accuracy')
generar_arbol("7_7d", 'gini', 1, 'accuracy')

