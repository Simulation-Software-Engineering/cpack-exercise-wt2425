include(CPack)

# Set package details
set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_DESCRIPTION "Detailed description of the cpackexample package.")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Example project to demonstrate CPack packaging")
set(CPACK_PACKAGE_VENDOR "Vaish-W")
set(CPACK_PACKAGE_CONTACT "wanivaishnavi16@gmail.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Vaish-W/cpack-exercise-wt2425")

# Licensing and README
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# Specify generators
set(CPACK_GENERATOR "TGZ;DEB")

# Debian-specific configuration
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Vaishnavi <wanivaishnavi16@gmail.com>")  # Required field
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp-dev, libboost-filesystem1.83.0")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
include(CPack)

