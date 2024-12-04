cmake_minimum_required(VERSION "3.28")

project("cpackexample" VERSION 0.1.0)

FIND_PACKAGE(deal.II 9.5 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# Uses the FindBoost module of CMake
find_package(Boost 1.83 COMPONENTS filesystem REQUIRED)

find_package(yaml-cpp 0.6 REQUIRED)

add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)
#add_library(cpackexamplelib)
add_executable("${PROJECT_NAME}" main.cpp)

# Add headers to target sources using target_sources command (since CMake 3.23)
# By using that command, we can ensure, that the relative path is kept
#
# To keep it clean/in one place we could also add the *.cpp files here.
# But then they are recompiled for the binary as well as the library.
# Probably would need some more CMake configuration to get it working, but for now I keep it like this.
target_sources(cpackexamplelib
  #  PUBLIC
  #  ${CMAKE_CURRENT_SOURCE_DIR}/fem/fem.cpp
  #  ${CMAKE_CURRENT_SOURCE_DIR}/filesystem/filesystem.cpp
  #  ${CMAKE_CURRENT_SOURCE_DIR}/flatset/flatset.cpp
  #  ${CMAKE_CURRENT_SOURCE_DIR}/yamlParser/yamlParser.cpp
  PUBLIC FILE_SET HEADERS
  BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR} FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/fem/fem.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/filesystem/filesystem.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/flatset/flatset.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/yamlParser/yamlParser.hpp
)

target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

target_include_directories(cpackexamplelib
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>

    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib>
)

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

include(GNUInstallDirs)
install(TARGETS cpackexamplelib cpackexample
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )

  install(TARGETS cpackexamplelib
    FILE_SET HEADERS
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  )

