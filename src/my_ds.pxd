# c++的std库
from libcpp.vector cimport vector

cdef extern from "DataSet.hpp" namespace "structured_prediction":
    # 结构内容需在pxd中说明，否则pyx中一旦使用结构成员，则会编译出错
    ctypedef struct FeatureItem:
        int fid
        int val

    cdef cppclass DataSet:
        # 所有public成员
        vector[FeatureItem] x
        DataSet() except +  # 异常说明
        int size()
        bint append(vector[FeatureItem] x)  # cython中无bool，用bint替代
        void clear()
        FeatureItem getX(int idx)
    
    # callback回调函数
    cdef void processBar(size_t wait_time, size_t total, void (*show_cb)(int) )