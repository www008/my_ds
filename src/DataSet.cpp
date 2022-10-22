#include <iostream>
#include <stdexcept>
#include "DataSet.hpp"
//#include <tbb/tbb.h>
#include <windows.h>

namespace structured_prediction {

    DataSet::DataSet () {}

    DataSet::~DataSet () {}

    int DataSet::size() {
        return this->x.size();
    }

    // bool DataSet::append(int x) {
    //     this->x.push_back(x);
    //     tbb::parallel_invoke(
    //         []() { std::cout << " Hello " << std::endl; },
    //         []() { std::cout << " TBB! " << std::endl; }
    //     );
    //     return true;
    // }

    bool DataSet::append(std::vector<FeatureItem> x) {
        for (auto it=x.begin(); it<x.end(); it++){
            this->x.push_back(*it);
        }
        return true;
    }
    
    void DataSet::clear() {
        this->x.clear();
    }
    
    FeatureItem& DataSet::getX(int idx) {
        if (idx >= 0 && idx < this->x.size()){
            return this->x.at(idx);
        }
        throw std::runtime_error("idx out of range");
    };

    void processBar(size_t wait_time, size_t total, void (*show_cb)(int) ) {
        for (int i=0; i<total; i++){
            Sleep(wait_time);
            (*show_cb)(i);
        }
    }
}
