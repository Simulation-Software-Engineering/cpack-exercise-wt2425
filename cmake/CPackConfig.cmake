set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE cpack exercise")
set(CPACK_PACKAGE_DESCRIPTION "This is the SSE cpack exercise which includes a simple example with multiple dependencies both in this repository and resolved through the operating system POSIX standard paths.")

set(CPACK_PACKAGE_VENDOR "SSE student")
set(CPACK_PACKAGE_CONTACT "st170001@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "SSE student ${CPACK_PACKAGE_VENDOR} ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io")


set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${CPACK_PACKAGE_CONTACT})

# "libyaml-cpp dependency"
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.8")
# Additional changelog
set(CPACK_DEBIAN_PACKAGE_CHANGES "${CMAKE_CURRENT_SOURCE_DIR}/debian/changelog")
# Set package maintainer
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${CPACK_PACKAGE_MAINTAINERS})
# Additional copyright file
set(CPACK_DEBIAN_PACKAGE_COPYRIGHT "${CMAKE_CURRENT_SOURCE_DIR}/debian/copyright")

# Strip files for cpack
set(CPACK_STRIP_FILES TRUE)

include(CPack)