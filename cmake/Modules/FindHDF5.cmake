# - Try to find HDF5
#
# The following variables are optionally searched for defaults
#
# The following are set after configuration is done:
#  HDF5_FOUND
#  HDF5_INCLUDE_DIRS
#  HDF5_LIBRARIES
#  HDF5_LIBRARYRARY_DIRS

find_path(HDF5_INCLUDE_DIR hdf5.h
    PATHS ${CMAKE_SOURCE_DIR}/thirdparty/hdf5-1.10.0-patch1/include/src
	)

if(MSVC)
    find_library(HDF5_LIBRARY_RELEASE libhdf5
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/hdf5-1.10.0-patch1/lib
        PATH_SUFFIXES Release
		)

    find_library(HDF5_LIBRARY_DEBUG libhdf5_D
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/hdf5-1.10.0-patch1/lib
        PATH_SUFFIXES Debug
		)

    set(HDF5_LIBRARY optimized ${HDF5_LIBRARY_RELEASE} debug ${HDF5_LIBRARY_DEBUG})
else()
    find_library(HDF5_LIBRARY HDF5
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/hdf5-1.10.0-patch1/lib
        PATH_SUFFIXES lib lib64)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HDF5 DEFAULT_MSG HDF5_INCLUDE_DIR HDF5_LIBRARY)

if(HDF5_FOUND)
  set(HDF5_INCLUDE_DIRS ${HDF5_INCLUDE_DIR})
  set(HDF5_LIBRARIES ${HDF5_LIBRARY})
  message(STATUS "Found HDF5")
  mark_as_advanced(HDF5_ROOT_DIR HDF5_LIBRARY_RELEASE HDF5_LIBRARY_DEBUG
                                 HDF5_LIBRARY HDF5_INCLUDE_DIR)
endif()
