find_package(
    Qt5
    REQUIRED
    COMPONENTS
        PrintSupport
)

function(qtn_example_target_setup TARGET)

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

    target_link_libraries(
        ${TARGET}
        PRIVATE
            Qt5::PrintSupport
            qtitanribbon-static
    )

    target_include_directories(
        ${TARGET}
        PRIVATE
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/ribbon/shared
    )

    target_sources(
        ${TARGET}
        PRIVATE
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared/aboutdialog.cpp
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared/aboutdialog.h
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared/aboutdialog.qrc
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared/DemoMainWindow.cpp
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/shared/DemoMainWindow.h

            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/ribbon/shared/DemoRibbonWindow.cpp
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/ribbon/shared/DemoRibbonWindow.h
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../lib/examples/ribbon/shared/DemoRibbonWindow.qrc
    )

endfunction()
