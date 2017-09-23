import cython
from libc cimport stdint
from common cimport PCLHeader
from common import HeaderPy, HeaderWrap

cdef extern from "test_cython.hpp" namespace "tstcyt":
    cdef cppclass TestCython:
      TestCython() except +
      void add_seqs(const PCLHeader header)
      stdint.uint32_t get_seq()
      void set_seq(stdint.uint32_t seq)

cdef class TestWrap:
    cdef TestCython* test_wrap_cpp
    def __cinit__(self):
        self.test_wrap_cpp = new TestCython()
    def __dealloc__(self):
        if self.test_wrap_cpp != NULL:
            del self.test_wrap_cpp
    def __init__(self):
        pass
    @property
    def seq(self):
        return self.test_wrap_cpp.get_seq()
    @seq.setter
    def seq(self, s):
        self.test_wrap_cpp.set_seq(s)
    def add_seqs(self, h): # simply adds the seq values of this with input h
        print 'old seq', self.seq()
        hw = HeaderWrap(h)
        #self.test_wrap_cpp.add_seqs(hw.header_cpp[0]) # compile error?
        print 'new seq', self.seq()
