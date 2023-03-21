include(../../example_setup.cmake)

set(TARGET qtn-example-toolbarcontrol)

add_executable(${TARGET})

qtn_example_target_setup(${TARGET})

set(BASE_PATH "../../../lib/examples/ribbon/ToolBarControlDemo")
target_sources(
    ${TARGET}
    PRIVATE
        ${BASE_PATH}/main.cpp
        ${BASE_PATH}/mainwindow.cpp
        ${BASE_PATH}/mainwindow.h
        ${BASE_PATH}/ToolBarControlDemo.qrc
)
