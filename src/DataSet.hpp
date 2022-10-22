#ifndef DATASET_HPP
#define DATASET_HPP
#include <vector>

namespace structured_prediction {
    typedef struct _FeatureItem {
        int fid;
        int val;
    } FeatureItem;

    class DataSet {
        public:
            std::vector<FeatureItem> x;
            DataSet();
            ~DataSet();
            int size();
            bool append(std::vector<FeatureItem> x);
            void clear();
            FeatureItem& getX(int idx);
    };

    void processBar(size_t wait_time, size_t total, void (*show_cb)(int) );
}

#endif