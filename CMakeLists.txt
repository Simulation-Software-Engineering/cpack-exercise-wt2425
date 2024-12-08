cmake_minimum_required(VERSION "3.28")

project("cpackexample" VERSION 0.1.0)

FIND_PACKAGE(deal.II 9.5 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# Uses the FindBoost module of CMake
find_package(Boost 1.83 COMPONENTS filesystem REQUIRED)

find_package(yaml-cpp 0.6 REQUIRED)

add_library(cpackexamplelib SHARED filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)
set(MULTIPLE_PUBLIC_HEADERS "filesystem/filesystem.hpp" "fem/fem.hpp" "flatset/flatset.hpp")

set_target_properties(cpackexamplelib
    PROPERTIES
        PUBLIC_HEADER "${MULTIPLE_PUBLIC_HEADERS}"
)

add_executable("${PROJECT_NAME}" main.cpp)

target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

# Create install targets
include(GNUInstallDirs)
install(TARGETS cpackexample cpackexamplelib
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cpackexamplelib
)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cpackexample.1.gz
    DESTINATION share/man/man1
)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/changelog.gz
    DESTINATION share/doc/libcpackexamplelib
)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/copyright
    DESTINATION share/doc/libcpackexamplelib
)

# Adding other cmake modules 
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Include our packaging module (cmake/CPackConfig.cmake)
include(CPackConfig)

