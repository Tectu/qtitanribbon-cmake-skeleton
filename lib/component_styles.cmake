list(APPEND HEADERS_PUBLIC
    src/styles/QtnOfficeStyle.h
    src/styles/QtnOffice2007Style.h
    src/styles/QtnOffice2010Style.h
    src/styles/QtnOffice2013Style.h
    src/styles/QtnOffice2016Style.h
    src/styles/QtnWindows7ScenicStyle.h
    src/styles/QtnAdobePhotoshopStyle.h
    src/styles/QtnVisualStudio2019Style.h
    src/styles/QtnFluentDesignStyle.h
)

function(qtn_component_styles_target_setup TARGET)

    target_include_directories(
        ${TARGET}
        PRIVATE
            src/styles
    )

    target_sources(
        ${TARGET}
        PRIVATE
            # PUBLIC_HEADERS
            ${HEADERS_PUBLIC}

            # ALL_SOURCES
            src/styles/QtnOfficeStyle.cpp
            src/styles/QtnOffice2007Style.cpp
            src/styles/QtnOffice2010Style.cpp
            src/styles/QtnOffice2013Style.cpp
            src/styles/QtnOffice2016Style.cpp
            src/styles/QtnWindows7ScenicStyle.cpp
            src/styles/QtnAdobePhotoshopStyle.cpp
            src/styles/QtnVisualStudio2019Style.cpp
            src/styles/QtnFluentDesignStyle.cpp

            # PRIVATE_HEADERS
            src/styles/QtnOffice2007StylePrivate.h
            src/styles/QtnOffice2010StylePrivate.h
            src/styles/QtnOffice2013StylePrivate.h
            src/styles/QtnWindows7ScenicStylePrivate.h
            src/styles/QtnOfficeStylePrivate.h
            src/styles/QtnVisualStudio2019StylePrivate.h
            src/styles/QtnFluentDesignStylePrivate.h

            # Resources
            src/styles/QtnOffice2007Style.qrc
            src/styles/QtnOffice2010Style.qrc
            src/styles/QtnOffice2013Style.qrc
            src/styles/QtnOffice2016Style.qrc
            src/styles/QtnWindows7ScenicStyle.qrc
            src/styles/QtnAdobePhotoshopStyle.qrc
            src/styles/QtnVisualStudio2019Style.qrc
    )

endfunction()
