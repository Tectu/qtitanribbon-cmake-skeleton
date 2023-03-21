include(../../example_setup.cmake)

set(TARGET qtn-example-application)

add_executable(${TARGET})

qtn_example_target_setup(${TARGET})

target_sources(
    ${TARGET}
    PRIVATE
        ../../../lib/examples/ribbon/Application/Application.qrc
        ../../../lib/examples/ribbon/Application/main.cpp
        ../../../lib/examples/ribbon/Application/mainwindow.cpp
        ../../../lib/examples/ribbon/Application/mainwindow.h
        ../../../lib/examples/ribbon/Application/ribbonpopularpage.cpp
        ../../../lib/examples/ribbon/Application/ribbonpopularpage.h
        ../../../lib/examples/ribbon/Application/ribbonpopularpage.ui
)
