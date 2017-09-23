from libc cimport stdint
from libcpp.string cimport string

cdef extern from "<pcl/PCLHeader.h>" namespace "pcl":
     cdef cppclass PCLHeader:
          Header() except +
          stdint.uint32_t seq
          stdint.uint64_t stamp
          string frame_id

cdef class HeaderWrap:
     cdef PCLHeader* header_cpp