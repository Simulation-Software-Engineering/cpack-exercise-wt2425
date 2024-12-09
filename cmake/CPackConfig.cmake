set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_VENDOR "SSE Student")
set(CPACK_PACKAGE_MAINTAINERS "tischlre")
set(CPACK_PACKAGE_CONTACT "st149535@stud.uni-stuttgart.de")

set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/365Bit/cpack-exercise-wt2425")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack example project")
set(CPACK_PACKAGE_DESCRIPTION "The SSE CPack example Project demonstrates how to use CMake and CPack to create a distributable package.")

set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_GENERATOR "TGZ;DEB")

set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${CPACK_PACKAGE_MAINTAINERS})
set(CPACK_STRIP_FILES "usr/bin/cpackexample;usr/lib/libcpackexamplelib.so")

install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/docs/changelog.gz" DESTINATION ${CMAKE_INSTALL_DOCDIR})
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/docs/copyright" DESTINATION ${CMAKE_INSTALL_DOCDIR})

include(CPack)