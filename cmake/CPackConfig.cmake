# CPack Configuration File

# Basic package details
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack project description as a part of SSE 2024/25")
set(CPACK_PACKAGE_VENDOR "Vedant Puranik")
set(CPACK_PACKAGE_CONTACT "Vedant Puranik<st189464@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/VedantKP/cpack-exercise-wt2425")

# Specify the package formats
set(CPACK_GENERATOR "TGZ;DEB")

# Ensure proper Debian package naming convention
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION}_${CMAKE_SYSTEM_PROCESSOR}")

# Define installation paths
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr")

# Automatically resolve library dependencies for DEB
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON) 

# Add explicit dependencies (e.g., yaml-cpp)
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp-dev (>= 0.6.3)")

# Optional metadata for the DEB package
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}") # Maintainer
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "CPack project Debian description as a part of SSE 2024/25")

# Ensures compiled code is stripped
set(CPACK_STRIP_FILES TRUE)

# Include the CPack module
include(CPack)