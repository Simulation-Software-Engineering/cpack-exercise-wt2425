# Minimum required CMake version
cmake_minimum_required(VERSION 3.10)

# Define the project and the C++ standard
project(cpackexample VERSION 0.1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Default to Release mode if not explicitly set
if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Build type not specified. Setting to Release mode.")
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the build type" FORCE)
endif()

# Collect all source files
file(GLOB_RECURSE ALL_SOURCES
    ${CMAKE_SOURCE_DIR}/main.cpp
    ${CMAKE_SOURCE_DIR}/flatset/*.cpp
    ${CMAKE_SOURCE_DIR}/filesystem/*.cpp
    ${CMAKE_SOURCE_DIR}/fem/*.cpp
    ${CMAKE_SOURCE_DIR}/yamlParser/*.cpp
)

# Collect header files
file(GLOB_RECURSE ALL_HEADERS
    ${CMAKE_SOURCE_DIR}/flatset/*.hpp
    ${CMAKE_SOURCE_DIR}/filesystem/*.hpp
    ${CMAKE_SOURCE_DIR}/fem/*.hpp
    ${CMAKE_SOURCE_DIR}/yamlParser/*.hpp
)

# Validate that source files are present
if(NOT ALL_SOURCES)
  message(FATAL_ERROR "No source files found. Please verify the directory structure.")
endif()

# Dependencies: yaml-cpp
find_package(yaml-cpp REQUIRED)

# Dependencies: Boost (specifically the filesystem module)
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem)

# Dependencies: deal.II
find_package(deal.II 9.5 REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
if(deal.II_FOUND)
  deal_ii_initialize_cached_variables()
endif()

# Add the library target
add_library(cpackexamplelib
    ${CMAKE_SOURCE_DIR}/flatset/flatset.cpp
    ${CMAKE_SOURCE_DIR}/filesystem/filesystem.cpp
    ${CMAKE_SOURCE_DIR}/fem/fem.cpp
    ${CMAKE_SOURCE_DIR}/yamlParser/yamlParser.cpp
)

# Add the executable target
add_executable(main ${CMAKE_SOURCE_DIR}/main.cpp)

# Link external libraries to the library
target_link_libraries(cpackexamplelib
    Boost::boost
    Boost::filesystem
    yaml-cpp
)
deal_ii_setup_target(cpackexamplelib)

# Link the library to the executable
target_link_libraries(main cpackexamplelib)
deal_ii_setup_target(main)

# Include directories
target_include_directories(cpackexamplelib PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include/cpackexamplelib>
)

# Installation rules
install(TARGETS main RUNTIME DESTINATION bin)
install(TARGETS cpackexamplelib ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
install(FILES ${ALL_HEADERS} DESTINATION include/cpackexamplelib)

# Install additional documentation files
install(FILES ${CMAKE_SOURCE_DIR}/copyright DESTINATION share/doc/cpackexample)
install(FILES ${CMAKE_SOURCE_DIR}/changelog.Debian.gz DESTINATION share/doc/cpackexample)
install(FILES ${CMAKE_SOURCE_DIR}/cpackexample.1.gz DESTINATION share/man/man1)

# CPack configuration
include(CPack)

# Package details
set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_CONTACT "Mohamed Youssef <mohamed.youssef@example.com>")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/MohamedAlyLoutfy/cpackexample")
set(CPACK_PACKAGE_VENDOR "Mohamed Youssef or Organization")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Example project for CPack packaging")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Binary package for cpackexample")
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_NAME "${CPACK_PACKAGE_NAME}")
set(CPACK_DEBIAN_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION}-1")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libboost-filesystem1.83.0, libc6")
set(CPACK_STRIP_FILES TRUE)

# Ensure DEB generation is explicitly set
set(CPACK_GENERATOR "TGZ;DEB")

# Exclude unnecessary files
set(CPACK_SOURCE_IGNORE_FILES
    "/build/;/.git/;/.gitignore;~$;/CMakeFiles/;/CMakeCache.txt;/cmake_install.cmake;/Makefile;/install_manifest.txt"
)

# Ensure only the install directory is packaged
set(CPACK_INSTALL_CMAKE_PROJECTS
    "${CMAKE_BINARY_DIR};${CMAKE_PROJECT_NAME};ALL;/"
)
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_BINARY_DIR}/packages")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CMAKE_SYSTEM_PROCESSOR}")

# Disable RPATH or RUNPATH
set(CMAKE_SKIP_RPATH TRUE)
set(CMAKE_INSTALL_RPATH "")
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)

# Include CPack to finalize settings
include(CPack)
