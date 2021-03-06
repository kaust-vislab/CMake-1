# - Try to find SuperCollider
# Once done, this will define
#
#  SuperCollider_FOUND - system has SuperCollider
#  SuperCollider_INCLUDE_DIRS - the SuperCollider include directories
#  SuperCollider_LIBRARIES - link these to use SuperCollider
#
# this file is modeled after http://www.cmake.org/Wiki/CMake:How_To_Find_Libraries

include(LibFindMacros)

# Include dir
find_path(SuperCollider_INCLUDE_DIR1
  NAMES SC_LanguageClient.h
  PATHS ${CMAKE_INCLUDE_PATH}
)

find_path(SuperCollider_INCLUDE_DIR2
  NAMES SC_Types.h
  PATHS ${CMAKE_INCLUDE_PATH}
)

find_path(SuperCollider_INCLUDE_DIR3
  NAMES SC_World.h
  PATHS ${CMAKE_INCLUDE_PATH}
)

find_path(SuperCollider_INCLUDE_DIR4
  NAMES SC_Lib.h
  PATHS ${CMAKE_INCLUDE_PATH}
)



# Finally the libraries itself
find_library(SuperCollider_LIBRARY1
  NAMES libscsynth scsynth
  PATHS ${CMAKE_LIBRARY_PATH}
)

# Finally the libraries itself
find_library(SuperCollider_LIBRARY2
  NAMES libsclang sclang
  PATHS ${CMAKE_LIBRARY_PATH}
)


# MADHU: Seems like libfind_process does not really set SuperCollider_FOUND to TRUE
# so doing this myself.
# if(SuperCollider_INCLUDE_DIR AND SuperCollider_LIBRARY)
#  set(SuperCollider_FOUND TRUE)
#  message(STATUS "Found SuperCollider in ${SuperCollider_INCLUDE_DIRS};${SuperCollider_LIBRARIES}")
#else()
#  message(FATAL_ERROR "Could not find SuperCollider Libraries and Headers")
#endif()

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
# MADHU: No idea what the following does ??
set(SuperCollider_PROCESS_INCLUDES 
  SuperCollider_INCLUDE_DIR1 
  SuperCollider_INCLUDE_DIR2  
  SuperCollider_INCLUDE_DIR3 
  SuperCollider_INCLUDE_DIR4 
)

set(SuperCollider_PROCESS_LIBS SuperCollider_LIBRARY1 SuperCollider_LIBRARY2)
libfind_process(SuperCollider)

