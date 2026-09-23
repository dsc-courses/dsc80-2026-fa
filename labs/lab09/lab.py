# lab.py


import pandas as pd
import numpy as np
np.set_printoptions(legacy='1.21')
from pathlib import Path
import plotly.express as px

from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import FunctionTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer


# ---------------------------------------------------------------------
# QUESTION 1
# ---------------------------------------------------------------------


def simple_pipeline(data):
    ...


# ---------------------------------------------------------------------
# QUESTION 2
# ---------------------------------------------------------------------


def multi_type_pipeline(data):
    ...


# ---------------------------------------------------------------------
# QUESTION 3
# ---------------------------------------------------------------------


# Imports
from sklearn.base import BaseEstimator, TransformerMixin

class StdScalerByGroup(BaseEstimator, TransformerMixin):

    def __init__(self):
        pass

    def fit(self, X, y=None):
        # X might not be a pandas DataFrame (e.g. a numpy array)
        df = pd.DataFrame(X)

        # Store the means and SDs for each column (e.g. 'c1' and 'c2'), 
        # for each group (e.g. 'A', 'B', 'C').  
        self.grps_ = ...

        return self

    def transform(self, X, y=None):
        # X might not be a pandas DataFrame (e.g. a numpy array)
        df = pd.DataFrame(X)

        try:
            getattr(self, "grps_")
        except AttributeError:
            raise RuntimeError("You must fit the transformer before transforming the data!")
        
        # Hint: Define a helper function here!
        return ...


# ---------------------------------------------------------------------
# QUESTION 4
# ---------------------------------------------------------------------


def eval_toy_model():
    ...


# ---------------------------------------------------------------------
# QUESTION 5
# ---------------------------------------------------------------------



def tree_reg_perf(galton):
    # Add your imports here
    ...

def knn_reg_perf(galton):
    # Add your imports here
    ...
