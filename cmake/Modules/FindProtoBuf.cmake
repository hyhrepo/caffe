# - Try to find ProtoBuf
#
# The following variables are optionally searched for defaults
#
# The following are set after configuration is done:
#  PROTOBUF_FOUND
#  PROTOBUF_INCLUDE_DIRS
#  PROTOBUF_LIBRARIES
#  PROTOBUF_PROTOC_EXECUTABLE


# We are testing only a couple of files in the include directories
if(WIN32)
    find_path(PROTOBUF_INCLUDE_DIR google/protobuf/type.pb.h
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/protobuf/include
		)
else()
    find_path(PROTOBUF_INCLUDE_DIR protobuf/type.pb.h
        PATHS ${ProtoBuf_ROOT_DIR}
		)
endif()

if(MSVC)
    find_library(ProtoBuf_LIBRARY_RELEASE
        NAMES libprotobuf
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/protobuf/lib
        PATH_SUFFIXES Release
		)

    find_library(ProtoBuf_LIBRARY_DEBUG
        NAMES libprotobufd
        PATHS ${CMAKE_SOURCE_DIR}/thirdparty/protobuf/lib
        PATH_SUFFIXES Debug
		)

    set(ProtoBuf_LIBRARY optimized ${ProtoBuf_LIBRARY_RELEASE} debug ${ProtoBuf_LIBRARY_DEBUG})
else()
    find_library(ProtoBuf_LIBRARY protobuf)
endif()
	
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ProtoBuf DEFAULT_MSG PROTOBUF_INCLUDE_DIR ProtoBuf_LIBRARY)


if(ProtoBuf_FOUND)
    set(ProtoBuf_INCLUDE_DIRS ${PROTOBUF_INCLUDE_DIR})
    set(ProtoBuf_LIBRARIES ${ProtoBuf_LIBRARY})
    set(PROTOBUF_PROTOC_EXECUTABLE ${CMAKE_SOURCE_DIR}/thirdparty/protobuf/lib/Release/protoc.exe)
    message(STATUS "Found protobuf")
    mark_as_advanced(ProtoBuf_LIBRARY_DEBUG ProtoBuf_LIBRARY_RELEASE
                     ProtoBuf_LIBRARY PROTOBUF_INCLUDE_DIR ProtoBuf_ROOT_DIR)
endif()
