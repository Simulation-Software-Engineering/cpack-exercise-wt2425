# Packaging with CPack

Repository for the [CPack exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cpack_exercise.md). The code is a slightly modified version of the [code used in the CMake exercise](https://github.com/Simulation-Software-Engineering/cmake-exercise-wt2425).

## Solved bonus exercise tasks

### 1. File size comparison

The comparison of the tar.gz package with and without file stripping results in:

```
du -h cpackexample-0.1.0-Linux-unstripped.tar.gz
4.4M	cpackexample-0.1.0-Linux-unstripped.tar.gz
```

```
du -h cpackexample-0.1.0-Linux.tar.gz
2.5M	cpackexample-0.1.0-Linux.tar.gz
```

The unstripped `cpackexample` archive requires 1.9M more storage space.

### 2. Fixed lintian warnings (tree representation of debugging problems)

- Error: `extended-description-is-empty` Extended description missing
  - Fixed by adding `set(CPACK_PACKAGE_DESCRIPTION "..."` with the description to CPackConfig.cmake
  - Warning: `extended-description-line-too-long`
    - Fixed by writing the extended description as a multiline string
- Error: `no-changelog-file` Changelog file missing
  - Fixed by adding `install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/changelog.gz" DESTINATION "${CMAKE_INSTALL_DOCDIR}")` to CPackConfig.cmake
  - Warning: `changelog-not-compressed-with-max-compression`
    - Fixed by using the option `-9` for the highest compression with `gzip` when compressing `changelog`
  - Warning: `initial-upload-closes-no-bugs`
- Error: `no-copyright-file` Copyright file missing
  - Fixed by adding `install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/copyright" DESTINATION "${CMAKE_INSTALL_DOCDIR}")` to CPackConfig.cmake
- Error: `malformed-contact`
  - Fixed by adding brackets: `${CPACK_PACKAGE_CONTACT}` -> `<${CPACK_PACKAGE_CONTACT}>` in the CPACK_PACKAGE_MAINTAINERS variable in CPackConfig.cmake

### 3. Build with Docker

Run the Docker container with the following command in the repository root:
`docker run --rm --mount type=bind,source="$(pwd)",target=/mnt/cpack-exercise CONTAINER_IMAGE`
