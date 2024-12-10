# Packaging with CPack

## Setup and package generation

- Pull the repository.
- In the root directory run ``docker build -t cpack-exercise-wolkobml .``
- To build the packages run ``docker run --rm -v "$(pwd)/output:/cpack-exercise/output" cpack-exercise-wolkobml``
- The generated  ``.deb`` and ``.tar.hz`` files should be in the folder "output".
