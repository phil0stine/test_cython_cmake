#include <pcl/PCLHeader.h>

namespace tstcyt{
  class TestCython{
  public:
    TestCython() {seq_ = 0;}
    uint32_t get_seq() {return seq_;}
    void set_seq(uint32_t seq) {seq_ = seq;}
    void add_seqs(const pcl::PCLHeader& header){seq_ += header.seq;}
    uint32_t seq_;
  };
}
