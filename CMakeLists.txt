cmake_minimum_required(VERSION "3.28")

project("cpackexample" VERSION 0.1.0)

set(CMAKE_INSTALL_PREFIX "/usr")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -s")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s")

find_package(deal.II 9.5 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(Boost 1.83 COMPONENTS filesystem REQUIRED)
find_package(yaml-cpp 0.6 REQUIRED)

add_library(cpackexamplelib 
  filesystem/filesystem.cpp 
  fem/fem.cpp 
  flatset/flatset.cpp 
  yamlParser/yamlParser.cpp
)

set_target_properties(cpackexamplelib PROPERTIES VERSION 1.0 SOVERSION 1)

add_executable("cpackexample" main.cpp)

target_link_libraries(cpackexample cpackexamplelib)
target_link_libraries(cpackexamplelib Boost::filesystem ${YAML_CPP_LIBRARIES})

DEAL_II_SETUP_TARGET("cpackexample")
DEAL_II_SETUP_TARGET(cpackexamplelib)

set(INSTALL_BINDIR bin)
set(INSTALL_LIBDIR lib)
set(INSTALL_INCLUDEDIR include/cpackexamplelib)

install(TARGETS cpackexample
        RUNTIME DESTINATION ${INSTALL_BINDIR})
install(TARGETS cpackexamplelib
        ARCHIVE DESTINATION ${INSTALL_LIBDIR}
        LIBRARY DESTINATION ${INSTALL_LIBDIR})
install(FILES 
  fem/fem.hpp 
  filesystem/filesystem.hpp 
  flatset/flatset.hpp 
  yamlParser/yamlParser.hpp
  DESTINATION ${INSTALL_INCLUDEDIR})

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/debian/changelog.Debian.gz
        DESTINATION share/doc/libcpackexamplelib1/)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/debian/copyright
        DESTINATION share/doc/libcpackexamplelib1/)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/debian/shlibs
        DESTINATION DEBIAN/)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/debian/cpackexample.1.gz
        DESTINATION share/man/man1/)

set(CPACK_PACKAGE_NAME "libcpackexamplelib1")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION "Debian package demonstrating CPack functionality for SSE Exercise.\n\
This package is an example to show how to create a .deb package using CPack.")
set(CPACK_PACKAGE_MAINTAINER "Syed Mustafa Ahmed <syedmustafaahmad@gmail.com>")
set(CPACK_PACKAGE_VENDOR "MyVendor")
set(CPACK_PACKAGE_CONTACT "syedmustafaahmad@gmail.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Simulation-Software-Engineering/cpack-exercise-wt2425")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/debian/triggers")
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libboost-filesystem1.83.0")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-source")

include(CPack)
