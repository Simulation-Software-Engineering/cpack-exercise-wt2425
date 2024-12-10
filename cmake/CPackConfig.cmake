set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack Example Project")
set(CPACK_PACKAGE_DESCRIPTION "This is SSE cpack exercise")

set(CPACK_PACKAGE_VENDOR "SSE")
set(CPACK_PACKAGE_CONTACT "st181070@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/lVentus/cpack-exercise-wt2425")

set(CPACK_GENERATOR "TGZ;DEB")

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Guanpu <st181070@stud.uni-stuttgart.de>")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp0.8, libboost-filesystem-dev, libc6")
set(CPACK_DEBIAN_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}_${CPACK_PACKAGE_VERSION}-${CMAKE_SYSTEM_PROCESSOR}")

add_custom_command(
    OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz"
    COMMAND gzip -9 --no-name -c "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog" > "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz"
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog"
    COMMENT "Compressing changelog file"
)

add_custom_target(compress_changelog ALL DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz")

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/changelog.gz" DESTINATION "${CMAKE_INSTALL_DOCDIR}")

install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/copyright" DESTINATION "${CMAKE_INSTALL_DOCDIR}")


set(CPACK_STRIP_FILES ON)

include(CPack)
