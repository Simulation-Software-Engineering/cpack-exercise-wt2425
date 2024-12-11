set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A small example project demonstrating the use of CPack.")
set(CPACK_PACKAGE_DESCRIPTION "This project demonstrates how to use CMake and CPack for software packaging. The code is split into a library and an executable for demonstration purposes.")
set(CPACK_PACKAGE_VENDOR "Yonatan Mamo")
set(CPACK_PACKAGE_CONTACT "girmayonatan86@gmail.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/YonatanGM/cpack-exercise-wt2425")

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Yonatan Mamo <girmayonatan86@gmail.com>")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_PACKAGE_RELEASE "1")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION}-${CPACK_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_GENERATOR "TGZ;DEB")

# Set the installation prefix to /usr
set(CMAKE_INSTALL_PREFIX "/usr")

# Install changelog and copyright files under /usr/share/doc
install(FILES "${CMAKE_SOURCE_DIR}/debian/changelog.gz" DESTINATION "/usr/share/doc/${CPACK_PACKAGE_NAME}")
install(FILES "${CMAKE_SOURCE_DIR}/debian/copyright" DESTINATION "/usr/share/doc/${CPACK_PACKAGE_NAME}")

# Enable stripping of binaries
set(CPACK_STRIP_FILES ON)

include(CPack)
