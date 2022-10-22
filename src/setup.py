from setuptools import setup, Extension
from Cython.Build import cythonize


ext = Extension(name="my_ds", 
                sources=["my_ds.pyx", "DataSet.cpp"]
        )

setup(ext_modules=cythonize(ext))

