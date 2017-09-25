cmake_minimum_required(VERSION 2.8.5)
project(test_cython)
set(CMAKE_BUILD_TYPE RelWithDebInfo)
set(CYTHON_IS_CXX 1)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_FLAGS "-std=c++0x -fPIC")

find_package(PCL REQUIRED)
add_definitions(${PCL_DEFINITIONS})
include_directories(${PCL_INCLUDE_DIRS})

find_package(Cython REQUIRED)
include(UseCython)

include_directories(include)
set_source_files_properties(common.pyx PROPERTIES CYTHON_IS_CXX TRUE)
cython_add_module(common common.pyx)
target_link_libraries(common ${PCL_LIBRARIES})

set_source_files_properties(test_cython.pyx PROPERTIES CYTHON_IS_CXX TRUE)
cython_add_module(test_cython test_cython.pyx)
target_link_libraries(test_cython ${PCL_LIBRARIES})