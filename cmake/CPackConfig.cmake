set(CPACK_PACKAGE_NAME ${PROJECT_NAME})

set(CPACK_PACKAGE_VENDOR "SSE student")
set(CPACK_PACKAGE_CONTACT "The SSE student <st157773@stud.uni-stuttgart.de>")
#set(CPACK_PACKAGE_MAINTAINERS "${CPACK_PACKAGE_VENDOR} ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SSE cpackexample project")
set(CPACK_PACKAGE_DESCRIPTION "This is an extended summary. The SSE cpackexample project is a simple example project that demonstrates how to use CMake and CPack to create a distributable package. It uses the deal.II library, Boost, and yaml-cpp.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://simulation-software-engineering.github.io")
set(CPACK_PACKAGE_CHECKSUM "SHA256")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
# strip really all Debug symbols
set(CPACK_STRIP_FILES TRUE)

set(CPACK_GENERATOR "TGZ;DEB")

# DEB
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS_POLICY "=")

set(CPACK_DEBIAN_PACKAGE_PROVIDES "cpackexample")
set(CPACK_DEBIAN_PACKAGE_REPLACES "cpackexample")

# add libyaml-cpp
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.8")
# fix "extended-description-is-empty" warning
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "SSE cpackexample project using CMake, CPack, deal.II, Boost, and yaml-cpp.")
# fix "no-phrase" warning
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${CPACK_PACKAGE_MAINTAINERS})
# fix "no-copyright-file" warning
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/copyright"
    DESTINATION "${CMAKE_INSTALL_DOCDIR}"
    )
# fix "no-changelog" warning
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog.gz"
    DESTINATION "${CMAKE_INSTALL_DOCDIR}"
    )
# fix "lacks-ldconfig-trigger" warning - thanks to precice!
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/triggers")

include(CPack)