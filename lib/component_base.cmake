list(APPEND HEADERS_PUBLIC
    src/base/QtitanDef.h
    src/base/QtnPopupMenu.h
    src/base/QtnWindowTitleBar.h
    src/base/QtnMaterialWidget.h
    src/base/QtnCommonStyle.h
    src/base/QtnSegoeMDL2Assets.h
    src/base/QtnWindowsColor.h
    src/base/QtnToolTip.h
    src/base/QtnToggleSwitch.h
    src/base/QtnColorButton.h
    src/base/QtnXML.h
)

function(qtn_component_base_target_setup TARGET)

    target_include_directories(
        ${TARGET}
        PRIVATE
            src/base
    )

    # OpenGL stuff
    if (${QTN_OPENGL_ENABLE})
        target_sources(
            ${TARGET}
            PRIVATE
                src/base/QtnOpenGLEffect.h
                src/base/QtnOpenGLEffect.cpp
                src/base/QtnOpenGLShaders.qrc
        )

        # ToDo: This is from qmake
        # QT += opengl
    endif()

    # Common
    target_sources(
        ${TARGET}
        PRIVATE
            # HEADERS_PUBLIC
            ${HEADERS_PUBLIC}

            # HEADERS_PRIVATE
            src/base/QtnAbstractTabBar.h
            src/base/QtitanMSVSDebug.h
            src/base/QtnPlatform.h
            src/base/QtnCustomLayout.h
            src/base/QtnPopupMenuPrivate.h
            src/base/QtnScrollWidgetBar.h
            src/base/QtnBackstageWidget.h
            src/base/QtnWindowTitleBarPrivate.h
            src/base/QtnCommonStylePrivate.h
            src/base/QtnStyleHelperPrivate.h
            #    src/base/QtnCalculatorWidgetPrivate.h
            src/base/QtnStyleOption.h

            # ALL_SOURCES
            src/base/QtnAbstractTabBar.cpp
            src/base/QtnCustomLayout.cpp
            src/base/QtnPopupMenu.cpp
            src/base/QtnScrollWidgetBar.cpp
            src/base/QtnBackstageWidget.cpp
            src/base/QtnWindowTitleBar.cpp
            src/base/QtnMaterialWidget.cpp
            src/base/QtnSegoeMDL2Assets.cpp
            src/base/QtnCommonStyle.cpp
            src/base/QtnStyleHelper.cpp
            src/base/QtnStyleOption.cpp
            src/base/QtnToggleSwitch.cpp
            src/base/QtnToolTip.cpp
            src/base/QtnWindowsColor.cpp
            #    src/base/QtnCalculatorWidget.cpp
            src/base/QtnColorButton.cpp
            src/base/QtnPlatform.cpp

            # RESOURCES
            src/base/QtnBaseResources.qrc
    )

    # Windows
    if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")

        target_sources(
            ${TARGET}
            PRIVATE
                src/base/QtnPlatform_win.cpp
                src/base/QtnPlatform_win.h
                src/base/QtnWindowTitleBar_win.cpp
                src/base/QtnWindowTitleBar_win.h
                src/base/QtnCommonStyle_win.cpp
                src/base/QtnWindowTitleBarGlow_win.cpp
                src/base/QtnWindowTitleBarGlow_win.h
        )

        target_compile_definitions(
            ${TARGET}
            PUBLIC
                _WINDOWS
        )

        target_link_libraries(
            ${TARGET}
            PUBLIC
                user32
                gdi32
                shell32
                comctl32
        )

    # FreeBSD
    elseif (${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD")

        target_sources(
            ${TARGET}
            PRIVATE
                src/base/QtnPlatform_linux.cpp
                src/base/QtnCommonStyle_linux.cpp
        )

        target_link_libraries(
            ${TARGET}
            PUBLIC
                X11
        )

        target_compile_definitions(
            ${TARGET}
            PRIVATE
                Q_OS_LINUX
        )

        target_link_directories(
            ${TARGET}
            PUBLIC
                /usr/local/lib
        )

    # Linux
    elseif (${CMAKE_SYSTEM_NAME} MATCHES "Linux")

        target_sources(
            ${TARGET}
            PRIVATE
                src/base/QtnPlatform_linux.cpp
                src/base/QtnCommonStyle_linux.cpp
        )

        target_link_libraries(
            ${TARGET}
            PUBLIC
                X11
        )

    # MacOS
    elseif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

        # ToDo: Not sure if these are required
        #set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED NO)
        #set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "")

        target_sources(
            ${TARGET}
            PRIVATE
                src/base/QtnPlatform_mac.mm
                src/base/QtnCommonStyle_mac.mm
        )

        target_link_libraries(
            ${TARGET}
            PUBLIC
                "-framework AppKit"
                "-framework Carbon"
        )

    endif()

endfunction()
