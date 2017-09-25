import cython
from libc cimport stdint
from common cimport PCLHeader, HeaderWrap
from common import HeaderPy, HeaderWrap

cdef extern from "test_cython.hpp" namespace "tstcyt":
    cdef cppclass TestCython:
      TestCython() except +
      void add_seqs(const PCLHeader header)
      stdint.uint32_t get_seq()
      void set_seq(stdint.uint32_t seq)

cdef class TestWrap:
    cdef TestCython* test_wrap_cpp
    cdef public object seq
    def __cinit__(self):
        self.test_wrap_cpp = new TestCython()
    def __dealloc__(self):
        if self.test_wrap_cpp != NULL:
            del self.test_wrap_cpp
    def __init__(self, s=0):
        self.seq = s

#     @property # issue using property with setter
#     def seq(self):
#         return self.seq_
# #        return self.test_wrap_cpp.get_seq()
#     @seq.setter
#     def seq(self, s):
#         print 'setting'
#         self.seq_ = s
# #        self.test_wrap_cpp.set_seq(s)
    def add_seqs(self, h): # simply adds the seq values of this with input h
        print 'old seq', self.test_wrap_cpp.get_seq()
        self.test_wrap_cpp.add_seqs(HeaderWrap(h).header_cpp[0])
        print 'new seq', self.test_wrap_cpp.get_seq()
