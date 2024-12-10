# Set the package's version
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")

# Set the package's metadata
set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VENDOR "Saranya Vanga")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "An example CPack packaging setup")
set(CPACK_PACKAGE_DESCRIPTION "This package provides an example of using CPack with a CMake-based project.")
set(CPACK_PACKAGE_MAINTAINER "Saranya Vanga <vangasaranya1289@example.com>")
set(CPACK_PACKAGE_CONTACT "vangasaranya1289@example.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/SaranyaVanga2508/cpack-exercise-wt2425")

# Specify where to install files
set(CPACK_PACKAGE_INSTALL_DIRECTORY "cpackexample")

# Specify packaging formats
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_STRIP_FILES TRUE)

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Saranya Vanga <vangasaranya1289@example.com>")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")  
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.6")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/documents/changelog.gz" DESTINATION ${CMAKE_INSTALL_DOCDIR})
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/documents/copyright" DESTINATION ${CMAKE_INSTALL_DOCDIR})

include(CPack)
