########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(libmysqlclient_FIND_QUIETLY)
    set(libmysqlclient_MESSAGE_MODE VERBOSE)
else()
    set(libmysqlclient_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/libmysqlclientTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${libmysqlclient_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(libmysqlclient_VERSION_STRING "8.1.0")
set(libmysqlclient_INCLUDE_DIRS ${libmysqlclient_INCLUDE_DIRS_RELEASE} )
set(libmysqlclient_INCLUDE_DIR ${libmysqlclient_INCLUDE_DIRS_RELEASE} )
set(libmysqlclient_LIBRARIES ${libmysqlclient_LIBRARIES_RELEASE} )
set(libmysqlclient_DEFINITIONS ${libmysqlclient_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${libmysqlclient_BUILD_MODULES_PATHS_RELEASE} )
    message(${libmysqlclient_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


