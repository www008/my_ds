# distutils: language = c++
# distutils: sources = DataSet.cpp
# cython: language_level=3
import cython

from my_ds cimport DataSet, FeatureItem, processBar
# from cpython.array cimport array
from libcpp.vector cimport vector
from cpython.dict cimport dict

cdef class PyDataSet:
    cdef DataSet *_thisptr

    def __cinit__(self):
        self._thisptr = new DataSet()

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    cpdef int size(self):
        return self._thisptr.size()

    cpdef void clear(self):
        self._thisptr.clear()

    cpdef bint append(self, x:list[dict]):
        cdef vector[FeatureItem] xv
        cdef FeatureItem item
        if not isinstance(x, list):
            return False
        for v in x:
            item.fid = v['fid']
            item.val = v['val']
            xv.push_back(item)
        return self._thisptr.append(xv)

    cpdef dict getX(self, int idx):
        return self._thisptr.getX(idx)

    # Attribute access
    @property
    def x(self):
        return self._thisptr.x
    @x.setter
    def x(self, x):
        self._thisptr.append(x)

# --------  callback  -------------------
cdef object py_bar = None   # python回调函数

cdef void py_processbar_wrapper(int i): # 回调包装器，用于c -> python的参数类型转换
    py_bar(i)

def pyProcessBar(wait_time:int, total:int,showfunc=None): 
    '''python外部接口
        showfunc: python回调函数
    '''
    global py_bar
    py_bar = showfunc
    processBar(wait_time, total, py_processbar_wrapper)