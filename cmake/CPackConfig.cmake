set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPAck Exercise Example module")

set(CPACK_PACKAGE_VENDOR "Zipfeljs")
set(CPACK_PACKAGE_CONTACT "st186460@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "Zipfeljs")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/johzip/cpack-exercise-wt2425")

set(CPACK_GENERATOR "TGZ;DEB")

set(CPACK_DEBIAN_PACKAGE_MAINTAINER, "Johannes Zipfel st186460@stud.uni-stuttgart.de")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "CPAck and Debian Exercise Example module")

set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

set(CPACK_STRIP_FILES "usr/bin/cpackexample;usr/lib/libcpackexamplelib.so")

include(CPack)