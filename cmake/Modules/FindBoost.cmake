# Find the boost libraries
#
# The following variables are optionally searched for defaults
#
# The following are set after configuration is done:
#  BOOST_FOUND
#  BOOST_INCLUDE_DIR
#  BOOST_LIBRARIES


#SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_SOURCE_DIR}/thirdparty/boost_1_62_0/boost")
#SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_SOURCE_DIR}/thirdparty/boost_1_62_0/libs")

find_path(BOOST_INCLUDE_DIR
	NAMES boost.h
	PATHS ${CMAKE_SOURCE_DIR}/thirdparty/boost_1_62_0/boost)

find_library(BOOST_LIBRARIES
	NAMES boost
	PATHS ${CMAKE_SOURCE_DIR}/thirdparty/boost_1_62_0/libs)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Snappy DEFAULT_MSG Snappy_INCLUDE_DIR Snappy_LIBRARIES)

if(BOOST_FOUND)
    message(STATUS "Found boost")
endif()
