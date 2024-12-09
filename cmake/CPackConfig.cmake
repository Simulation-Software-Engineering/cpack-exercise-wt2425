include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_NAME "cpackexample")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_CONTACT "Mahek Mulla <itsmahekmulla@gmail.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack example project")
set(CPACK_PACKAGE_DESCRIPTION "The package that does the heavy lifting (so you don’t have to).!")
set(CPACK_PACKAGE_VENDOR "Simulation Software Engineering")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/mahek-mulla/cpack-exercise-wt2425.git")

set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Mahek Mulla <itsmahekmulla@gmail.com>")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}_amd64")
set(CPACK_GENERATOR "TGZ;DEB")

# Add the changelog and copyright files from the debian folder
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog.gz"
        DESTINATION "share/doc/${CPACK_PACKAGE_NAME}")
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/copyright"
        DESTINATION "share/doc/${CPACK_PACKAGE_NAME}")

#set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.6")
        
# Strip files for cpack
set(CPACK_STRIP_FILES TRUE)

include(CPack)