set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE cpack exercise")
set(CPACK_PACKAGE_DESCRIPTION "This is the SSE cpack exercise which includes a simple example
with multiple dependencies both in this repository
and resolved through the operating system POSIX standard paths.")

set(CPACK_PACKAGE_VENDOR "SSE student")
set(CPACK_PACKAGE_CONTACT "st170001@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "${CPACK_PACKAGE_VENDOR} <${CPACK_PACKAGE_CONTACT}>")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io")


set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

# "libyaml-cpp dependency"
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.8")
# Additional changelog
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog.gz" DESTINATION "${CMAKE_INSTALL_DOCDIR}")
# Set package maintainer
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_MAINTAINERS}")
# Additional copyright file
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/copyright" DESTINATION "${CMAKE_INSTALL_DOCDIR}")

# Strip files for cpack
set(CPACK_STRIP_FILES TRUE)

# Standard generator config for tar.zg archives and debian packages
set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)