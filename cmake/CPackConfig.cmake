# CPack configuration
set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_VENDOR "Marcel Wolkober")
#Linter: fix Maintainer
set(CPACK_PACKAGE_CONTACT "Marcel Wolkober <st163937@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A simple example project using CPack for the SSE Course")
#Linter: fix description
set(CPACK_PACKAGE_DESCRIPTION "This is a simple example project of the SSE Course of University Stuttgart to get used to packaging with CPack.")
set(CPACK_PACKAGE_MAINTAINERS "Marcel Wolkober ${CPACK_PACKAGE_CONTACT}")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/MarcelWolkober/cpack-exercise-wt2425")
set(CPACK_GENERATOR "TGZ;DEB")

# Debian packaging section
set(CPACK_DEBIAN_PACKAGE_NAME "cpackexample")
set(CPACK_DEBIAN_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION}")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

#add libyaml dependency
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.8")

#linter: strip files 
set(CPACK_STRIP_FILES TRUE)

# Install the COPYRIGHT file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/files/copyright
  DESTINATION ${CMAKE_INSTALL_DOCDIR})

# Install the CHANGELOG file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/files/changelog.gz
  DESTINATION ${CMAKE_INSTALL_DOCDIR})

include(CPack)