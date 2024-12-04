set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set(CPACK_PACKAGE_VENDOR "krampfkn")
set(CPACK_PACKAGE_CONTACT "Kilian Krampf<kilian@krampf.de>")

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Exemplary C++ code for packaging.")
string(CONCAT CPACK_PACKAGE_DESCRIPTION
    "#${PROJECT_NAME}\n"
    "Example code from the SSE lecture.\n"
    "This code has multiple dependencies and is\n"
    "built with CMake and packaged with CPack.\n"
)

set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Menkalian/cpack-exercise-wt2425")
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_STRIP_FILES TRUE)

set(CPACK_DEBIAN_PACKAGE_GENERATE_SHLIBS ON)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

# We would usually add some CMake code to automatically compress this during package generation
# (i.e. https://stackoverflow.com/a/62472396).
# For this exercise I will keep "generation of the changelogs" as manual process.
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/debian/changelog.gz"
    DESTINATION ${CMAKE_INSTALL_DOCDIR})

# There is currently no better way to include copyright (and the changelog) https://gitlab.kitware.com/cmake/cmake/-/issues/21832
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/debian/copyright"
    DESTINATION ${CMAKE_INSTALL_DOCDIR})

include(CPack)
