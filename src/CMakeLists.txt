# for tbb
# include_directories( ${PROJECT_SOURCE_DIR}/src "D:/Program Files (x86)/Intel/oneAPI/tbb/2021.7.0/include")
# link_directories( "D:/Program Files (x86)/Intel/oneAPI/tbb/2021.7.0/lib/intel64/vc_mt")

# # Specifies that Cython source files should generate C++
# set_source_files_properties( ${CMAKE_CURRENT_SOURCE_DIR}/my_ds.pyx PROPERTIES CYTHON_IS_CXX TRUE )

# # Adds and compiles Cython source into an extension module
# cython_add_module( my_ds my_ds.pyx DataSet.cpp)

# target_include_directories(my_ds PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} )

message(STATUS "CMAKE_CURRENT_BINARY_DIR=${TARGET_ARCHIVES_MAY_BE_SHARED_LIBS}")
add_custom_target(my_ds ALL
    COMMAND python setup.py build_ext -b ${CMAKE_CURRENT_BINARY_DIR} -t ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Cython编译..."
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    BYPRODUCTS *.pyd
)