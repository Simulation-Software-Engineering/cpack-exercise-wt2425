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
add_executable("${PROJECT_NAME}" main.cpp)

set_target_properties(cpackexamplelib PROPERTIES PUBLIC_HEADER "filesystem/filesystem.hpp;fem/fem.hpp;flatset/flatset.hpp;yamlParser/yamlParser.hpp")
target_include_directories(cpackexamplelib
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib>
)

target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

install(FILES ${CMAKE_SOURCE_DIR}/copyright
  DESTINATION "/usr/share/doc/${PROJECT_NAME}/"
  COMPONENT Documentation
)

include(GNUInstallDirs)
install(TARGETS "${PROJECT_NAME}" cpackexamplelib
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  )

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(CPackConfig)