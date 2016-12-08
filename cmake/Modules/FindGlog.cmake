# - Try to find Glog
#
# The following variables are optionally searched for defaults
#
# The following are set after configuration is done:
#  GLOG_FOUND
#  GLOG_INCLUDE_DIRS
#  GLOG_LIBRARIES
#  GLOG_LIBRARYRARY_DIRS

if(WIN32)
    find_path(GLOG_INCLUDE_DIR glog/logging.h
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/glog/include/windows
		)
else()
    find_path(GLOG_INCLUDE_DIR glog/logging.h.in
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/glog/include
		)
endif()

if(MSVC)
    find_library(GLOG_LIBRARY_RELEASE glog
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/glog/lib
        PATH_SUFFIXES Release
		)

    find_library(GLOG_LIBRARY_DEBUG glog
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/glog/lib
        PATH_SUFFIXES Debug
		)

    set(GLOG_LIBRARY optimized ${GLOG_LIBRARY_RELEASE} debug ${GLOG_LIBRARY_DEBUG})
else()
    find_library(GLOG_LIBRARY glog
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/glog/lib
        PATH_SUFFIXES lib lib64)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Glog DEFAULT_MSG GLOG_INCLUDE_DIR GLOG_LIBRARY)

if(GLOG_FOUND)
  set(GLOG_INCLUDE_DIRS ${GLOG_INCLUDE_DIR})
  set(GLOG_LIBRARIES ${GLOG_LIBRARY})
  message(STATUS "Found glog")
  mark_as_advanced(GLOG_ROOT_DIR GLOG_LIBRARY_RELEASE GLOG_LIBRARY_DEBUG
                                 GLOG_LIBRARY GLOG_INCLUDE_DIR)
endif()
