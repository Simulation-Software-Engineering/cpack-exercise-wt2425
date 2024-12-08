set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "SSE Lecturers")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack Exercise 2024/25W"
CACHE STRING "This is an exercise to create a package with CPack.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/lingachen/cpack-exercise-wt2425")
set(CPACK_PACKAGE_CONTACT "st191429@stud.uni-stuttgart.de")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
# set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp")
set(CPACK_STRIP_FILES TRUE)

set(CPACK_GENERATOR "TGZ;DEB")

include(CPack)