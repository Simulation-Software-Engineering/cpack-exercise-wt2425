set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE Cpack Exercise"
CACHE STRING "Just an exercise from SSE Course.")

set(CPACK_PACKAGE_VENDOR "SSE Student")
set(CPACK_PACKAGE_CONTACT "mgemaakbar@gmail.com")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "This is just a Debian package made for an exercise.")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Muhammad Gema Akbar <mgemaakbar@gmail.com>")
# set(CPACK_DEBIAN_PACKAGE_NAME "libcpackexamplelib1")
set(CPACK_PACKAGE_MAINTAINERS "SSE student ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/mgemaakbar/cpack-exercise-wt2425")
set(CPACK_GENERATOR "TGZ;DEB")

# Debian packaging section
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

# strip really all Debug symbols
set(CPACK_STRIP_FILES TRUE)

include(CPack)

