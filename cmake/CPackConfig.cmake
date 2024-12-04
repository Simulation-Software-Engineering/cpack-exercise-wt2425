# Define basic package information
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Toy porject for learning CPack")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "This project demonstrates how to create a Debian package using CMake.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Pinku-Neko/cpack-exercise-wt2425/tree/cpack-exercise")
set(CPACK_PACKAGE_CONTACT "Henry Cai <st166080@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_VENDOR "SSE 2024/25") # Vendor

# Package formats to generate
set(CPACK_GENERATOR "TGZ;DEB") # Create tar.gz and deb packages

# License and installation details
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_DEBIAN_PACKAGE_SECTION "utils") # Debian package category
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional") # Debian package priority
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}") # Debian package maintainer

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_DEBIAN_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION}-1")
set(CPACK_DEBIAN_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")


# dependencies
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libboost-filesystem1.83.0, libc6, libdeal.ii9.5.1")

# strip
set(CPACK_STRIP_FILES TRUE)

# Installation directories (ensure CPack knows where to find files)
include(CPack)
