cmake_minimum_required(VERSION "3.28")

project("cpackexample" VERSION 0.1.0)

FIND_PACKAGE(deal.II 9.5 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES()

set(CMAKE_SKIP_RPATH ON)
set(CPACK_SOURCE_IGNORE_FILES "/build/;/CMakeFiles/")

# Uses the FindBoost module of CMake
find_package(Boost 1.83 COMPONENTS filesystem REQUIRED)

find_package(yaml-cpp 0.6 REQUIRED)

# Create the library
add_library(cpackexamplelib filesystem/filesystem.cpp fem/fem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

# Create the executable
add_executable("${PROJECT_NAME}" main.cpp)

# Link libraries
target_link_libraries("${PROJECT_NAME}" cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

# Setup targets for deal.II
DEAL_II_SETUP_TARGET("${PROJECT_NAME}")
DEAL_II_SETUP_TARGET(cpackexamplelib)

# Define installation rules
# Install the executable
install(TARGETS "${PROJECT_NAME}"
    RUNTIME DESTINATION bin
)

# Install the library
install(TARGETS cpackexamplelib
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

# Install the header files
install(FILES fem/fem.hpp filesystem/filesystem.hpp flatset/flatset.hpp yamlParser/yamlParser.hpp
    DESTINATION include/cpackexamplelib
)

install(FILES ${CMAKE_SOURCE_DIR}/copyright
    DESTINATION /usr/share/doc/cpackexample)

include(cmake/CPackConfig.cmake)
