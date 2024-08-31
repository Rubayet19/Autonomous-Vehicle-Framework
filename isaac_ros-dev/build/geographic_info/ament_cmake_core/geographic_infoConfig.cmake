# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_geographic_info_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED geographic_info_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(geographic_info_FOUND FALSE)
  elseif(NOT geographic_info_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(geographic_info_FOUND FALSE)
  endif()
  return()
endif()
set(_geographic_info_CONFIG_INCLUDED TRUE)

# output package information
if(NOT geographic_info_FIND_QUIETLY)
  message(STATUS "Found geographic_info: 1.0.5 (${geographic_info_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'geographic_info' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${geographic_info_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(geographic_info_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${geographic_info_DIR}/${_extra}")
endforeach()
