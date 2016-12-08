# - Try to find GFLAGS
#
# The following variables are optionally searched for defaults
#
# The following are set after configuration is done:
#  GFLAGS_FOUND
#  GFLAGS_INCLUDE_DIRS
#  GFLAGS_LIBRARIES
#  GFLAGS_LIBRARYRARY_DIRS

find_path(GFLAGS_INCLUDE_DIR gflags/gflags.h
    PATHS ${CMAKE_SOURCE_DIR}/thirdparty/gflags/include
	)

if(MSVC)
    find_library(GFLAGS_LIBRARY_RELEASE
        NAMES gflags_static
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/gflags/lib
        PATH_SUFFIXES Release)

    find_library(GFLAGS_LIBRARY_DEBUG
        NAMES gflags_static
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/gflags/lib
        PATH_SUFFIXES Debug)

    set(GFLAGS_LIBRARY optimized ${GFLAGS_LIBRARY_RELEASE} debug ${GFLAGS_LIBRARY_DEBUG})
else()
    find_library(GFLAGS_LIBRARY gflags)
endif()


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GFlags DEFAULT_MSG GFLAGS_INCLUDE_DIR GFLAGS_LIBRARY)


if(GFLAGS_FOUND)
    set(GFLAGS_INCLUDE_DIRS ${GFLAGS_INCLUDE_DIR})
    set(GFLAGS_LIBRARIES ${GFLAGS_LIBRARY})
    message(STATUS "Found GFlags")
    mark_as_advanced(GFLAGS_LIBRARY_DEBUG GFLAGS_LIBRARY_RELEASE
                     GFLAGS_LIBRARY GFLAGS_INCLUDE_DIR GFLAGS_ROOT_DIR)
endif()
