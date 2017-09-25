from common cimport *

class HeaderPy(object):
    def __init__(self, seq):
        self.seq = seq

cdef class HeaderWrap:
    def __cinit__(self):
        self.header_cpp = new PCLHeader()
    def __dealloc__(self):
        if self.header_cpp != NULL:
            del self.header_cpp
    def __init__(self, h):
        self.py2cpp(h)
    def py2cpp(self, h):
        self.header_cpp.seq = h.seq
