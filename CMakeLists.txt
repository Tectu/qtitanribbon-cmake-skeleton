cmake_minimum_required(VERSION 3.18)

# Project
project(qtitanribbon
    VERSION 6.3.2
    LANGUAGES
        CXX
)

# Options
option(QTN_BUILD_EXAMPLES "Whether to build example applications" OFF)
option(QTN_OPENGL_ENABLE "Whether to use OpenGL" OFF)

# Settings
set(CMAKE_DEBUG_POSTFIX d)

# Add the library directory
add_subdirectory(lib)

# Add the test directory (if supposed to)
if (QTN_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()

################################################################################
# CPack                                                                        #
################################################################################
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
include(CPack)
