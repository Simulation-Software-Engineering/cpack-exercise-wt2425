include(CPack)

# Basic package information
set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VENDOR "Mohamed Youssef or Organization")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Example project for CPack packaging")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_CONTACT "mohamedloutfy97@gmail.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/MohamedAlyLoutfy/cpackexample")

# Supported package generators
set(CPACK_GENERATOR "TGZ;DEB")

# Debian-specific settings
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Mohamed Youssef") # Required field
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Binary package for cpackexample")
set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")

# Ensure only the install directory is packaged
set(CPACK_INSTALL_CMAKE_PROJECTS
    "${CMAKE_BINARY_DIR};${CMAKE_PROJECT_NAME};ALL;/")
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_BINARY_DIR}/packages")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CMAKE_SYSTEM_PROCESSOR}")

include(CPack)
