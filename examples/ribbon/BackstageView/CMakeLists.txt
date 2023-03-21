include(../../example_setup.cmake)

set(TARGET qtn-example-backstageview)

add_executable(${TARGET})

qtn_example_target_setup(${TARGET})

target_sources(
    ${TARGET}
    PRIVATE
        ../../../lib/examples/ribbon/BackstageView/backstagepages.cpp
        ../../../lib/examples/ribbon/BackstageView/backstagepages.h
        ../../../lib/examples/ribbon/BackstageView/BackstageView.qrc
        ../../../lib/examples/ribbon/BackstageView/helppage.ui
        ../../../lib/examples/ribbon/BackstageView/infopage.ui
        ../../../lib/examples/ribbon/BackstageView/main.cpp
        ../../../lib/examples/ribbon/BackstageView/mainwindow.cpp
        ../../../lib/examples/ribbon/BackstageView/mainwindow.h
        ../../../lib/examples/ribbon/BackstageView/saveemailpage.ui
        ../../../lib/examples/ribbon/BackstageView/savepage.ui
        ../../../lib/examples/ribbon/BackstageView/savewebpage.ui
)
