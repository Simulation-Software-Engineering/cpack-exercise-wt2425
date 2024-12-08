# Packaging with CPack

Repository for the [CPack exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cpack_exercise.md). The code is a slightly modified version of the [code used in the CMake exercise](https://github.com/Simulation-Software-Engineering/cmake-exercise-wt2425).

## Steps:
Run the following commands to complete the tasks of the exercise:

```console
sudo docker build -t cpack-exercise .
sudo docker run --rm -it --mount type=bind,source="$(pwd)",target=/mnt/cpack-exercise cpack-exercise
cd /mnt/cpack-exercise/
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ..
make -j${nproc}
make install
make package
lintian /mnt/cpack-exercise/build/libcpackexamplelib1-0.1.0.deb
```

I have seperated some library triggers, shlibs, copyright, maintainer information to the debian/* directory to make the CMakeLists.txt a bit more clearer.