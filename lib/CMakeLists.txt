include(external.cmake)
include(component_base.cmake)
include(component_fastinfoset.cmake)
include(component_ribbon.cmake)
include(component_styles.cmake)
include(component_translations.cmake)

# Helper variables
set(TARGET_NAME ${PROJECT_NAME})
set(TARGET_STATIC ${TARGET_NAME}-static)
set(TARGET_SHARED ${TARGET_NAME}-shared)


########################################################################################################################
# Common target setup
########################################################################################################################

function(qtn_target_setup TARGET)
    qtn_component_base_target_setup(${TARGET})
    qtn_component_fastinfoset_target_setup(${TARGET})
    qtn_component_ribbon_target_setup(${TARGET})
    qtn_component_styles_target_setup(${TARGET})
    qtn_component_translations_target_setup(${TARGET})

    target_compile_features(
        ${TARGET}
        PRIVATE
            cxx_std_17
    )

    set_target_properties(
        ${TARGET}
        PROPERTIES
            AUTOMOC ON
            AUTORCC ON
            AUTOUIC ON
    )

    target_include_directories(
        ${TARGET}
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
            $<INSTALL_INTERFACE:include>

            ${Qt5Core_PRIVATE_INCLUDE_DIRS}
            ${Qt5Gui_PRIVATE_INCLUDE_DIRS}
            ${Qt5Widgets_PRIVATE_INCLUDE_DIRS}
    )

    target_compile_definitions(
        ${TARGET}
        PUBLIC
            QTN_PRIVATE_HEADERS
        PRIVATE
            QT_NO_CAST_FROM_ASCII       # ToDo: Not sure if this needs to be PUBLIC
            QT_NO_DEPRECATED_WARNINGS   # ToDo: Not sure if this needs to be PUBLIC
    )

    target_link_libraries(
        ${TARGET}
        PUBLIC
            Qt5::Core
            Qt5::Gui
            Qt5::Widgets
    )
endfunction()

########################################################################################################################
# Static library
########################################################################################################################

add_library(${TARGET_NAME}-static STATIC)

qtn_target_setup(${TARGET_NAME}-static)

target_compile_definitions(
    ${TARGET_NAME}-static
    PUBLIC
        QTITAN_LIBRARY_STATIC
)


########################################################################################################################
# Shared library
########################################################################################################################

add_library(${TARGET_NAME}-shared SHARED)

qtn_target_setup(${TARGET_NAME}-shared)

target_compile_definitions(
    ${TARGET_NAME}-shared
    PRIVATE
        QTITAN_BASE_LIBRARY
        QTITAN_LIBRARY
)


########################################################################################################################
# Install                                                                      #
########################################################################################################################

# Some basic stuff we'll need in this section
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)
set(ConfigPackageLocation ${CMAKE_INSTALL_LIBDIR}/cmake/qtitanribbon)

# Install headers
install(
    DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/qtitanribbon
)
install(
    FILES ${HEADERS_PUBLIC}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/qtitanribbon
)

# Targets
install(
    TARGETS
        ${TARGET_NAME}-static
        ${TARGET_NAME}-shared
    EXPORT qtitanribbon-targets
    LIBRARY
        DESTINATION ${CMAKE_INSTALL_LIBDIR}
        COMPONENT lib
    ARCHIVE
        DESTINATION ${CMAKE_INSTALL_LIBDIR}
        COMPONENT lib
    RUNTIME
        DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT bin
    INCLUDES
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/qtitanribbon
)

# Package version
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/qtitanribbon/qtitanribbon-config-version.cmake"
    VERSION ${Qtitanribbon_VERSION}
    COMPATIBILITY AnyNewerVersion
)
install(
    FILES
    qtitanribbon-config.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/qtitanribbon/qtitanribbon-config-version.cmake"
    DESTINATION ${ConfigPackageLocation}
)

# Package configuration
configure_file(qtitanribbon-config.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/qtitanribbon/qtitanribbon-config.cmake"
    COPYONLY
)

# Package export targets
export(
    EXPORT qtitanribbon-targets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/qtitanribbon/qtitanribbon-targets.cmake"
    NAMESPACE qtitanribbon::
)
install(
    EXPORT qtitanribbon-targets
    FILE qtitanribbon-targets.cmake
    NAMESPACE qtitanribbon::
    DESTINATION ${ConfigPackageLocation}
)
