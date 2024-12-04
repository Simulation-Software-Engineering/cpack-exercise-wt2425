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

target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

target_include_directories(cpackexamplelib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
  $<INSTALL_INTERFACE:include/cpackexamplelib>
)

# Install the executable in <prefix>/bin
install(TARGETS "${PROJECT_NAME}"
  RUNTIME DESTINATION bin
)

# Install the library in <prefix>/lib
install(TARGETS cpackexamplelib
  ARCHIVE DESTINATION lib           # For static libraries
  LIBRARY DESTINATION lib           # For 	shared libraries
)

# Install the headers in <prefix>/include/cpackexamplelib
install(FILES fem/fem.hpp filesystem/filesystem.hpp flatset/flatset.hpp yamlParser/yamlParser.hpp
  DESTINATION include/cpackexamplelib
)

# copyright
install(FILES ${CMAKE_SOURCE_DIR}/copyright
    DESTINATION share/doc/cpackexample)

# add changelog
install(FILES ${CMAKE_SOURCE_DIR}/changelog.Debian.gz
    DESTINATION share/doc/cpackexample)

# manual page
install(FILES ${CMAKE_SOURCE_DIR}/cpackexample.1.gz
    DESTINATION share/man/man1)

# Add the CMake module path
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# Include the custom CPack configuration
include(CPackConfig)

add_custom_target(package_and_cleanup
    COMMAND ${CMAKE_COMMAND} --build . --target package
    COMMAND ${CMAKE_COMMAND} -E rm -rf ${CMAKE_BINARY_DIR}/install_manifest.txt
    COMMAND ${CMAKE_COMMAND} -E rm -rf ${CMAKE_BINARY_DIR}/_CPack_Packages
)
