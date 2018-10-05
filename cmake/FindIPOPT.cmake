#.rst:
# FindIPOPT
# ---------
#
# Try to locate the IPOPT library
#
# From https://github.com/robotology/icub-main/blob/master/conf/FindIPOPT.cmake
#
# Create the following variables::
#
#  IPOPT_INCLUDE_DIRS - Directories to include to use IPOPT
#  IPOPT_LIBRARIES    - Default library to link against to use IPOPT
#  IPOPT_DEFINITIONS  - Flags to be added to linker's options
#  IPOPT_LINK_FLAGS   - Flags to be added to linker's options
#  IPOPT_FOUND        - If false, don't try to use IPOPT
#

find_package(PkgConfig QUIET)
if(PKG_CONFIG_FOUND)

  if(IPOPT_FIND_VERSION)
      if(IPOPT_FIND_VERSION_EXACT)
          pkg_check_modules(_PC_IPOPT QUIET ipopt=${IPOPT_FIND_VERSION})
      else()
          pkg_check_modules(_PC_IPOPT QUIET ipopt>=${IPOPT_FIND_VERSION})
      endif()
  else()
      pkg_check_modules(_PC_IPOPT QUIET ipopt)
  endif()


  if(_PC_IPOPT_FOUND)
      set(IPOPT_INCLUDE_DIRS ${_PC_IPOPT_INCLUDE_DIRS} CACHE PATH "IPOPT include directory")
      set(IPOPT_DEFINITIONS ${_PC_IPOPT_CFLAGS_OTHER} CACHE STRING "Additional compiler flags for IPOPT")
      set(IPOPT_LIBRARIES "" CACHE STRING "IPOPT libraries" FORCE)
      foreach(_LIBRARY IN ITEMS ${_PC_IPOPT_LIBRARIES})
          find_library(${_LIBRARY}_PATH
                  NAMES ${_LIBRARY}
                  PATHS ${_PC_IPOPT_LIBRARY_DIRS})
          # Workaround for https://github.com/robotology/icub-main/issues/418
          if(${_LIBRARY}_PATH)
              list(APPEND IPOPT_LIBRARIES ${${_LIBRARY}_PATH})
          endif()
      endforeach()
  else()
      set(IPOPT_DEFINITIONS "")
  endif()

endif()

mark_as_advanced(IPOPT_INCLUDE_DIRS
        IPOPT_LIBRARIES
        IPOPT_DEFINITIONS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(IPOPT DEFAULT_MSG IPOPT_LIBRARIES)