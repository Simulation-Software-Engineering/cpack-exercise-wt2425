set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")

set(CPACK_PACKAGE_VENDOR "Simulation Software Engineering, Uni Stuttgart")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/niyati-n/cpack-exercise-wt2425")

set(CPACK_PACKAGE_CONTACT "st191812@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "niyati")

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE CPack-Exercise project")
set(CPACK_PACKAGE_DESCRIPTION "This is an SSE CPack example Project indicating how to package CMake and CPack code.")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

set(CPACK_GENERATOR "TGZ;DEB")

set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

include(CPack)