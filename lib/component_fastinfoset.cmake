list(APPEND HEADERS_PUBLIC
    src/fastinfoset/QtnFastInfosetDef.h
    src/fastinfoset/QtnFastInfosetStreamReader.h
    src/fastinfoset/QtnFastInfosetStreamWriter.h
)

function(qtn_component_fastinfoset_target_setup TARGET)

    target_include_directories(
        ${TARGET}
        PRIVATE
            src/fastinfoset
    )

    target_sources(
        ${TARGET}
        PRIVATE
            # PUBLIC_HEADERS
            ${HEADERS_PUBLIC}

            # PRIVATE_HEADERS
            src/fastinfoset/QtnFastInfosetConsts.h
            src/fastinfoset/QtnFastInfosetException.h
            src/fastinfoset/QtnFastInfosetUtils.h
            src/fastinfoset/QtnFastInfosetAlgorithms.h
            src/fastinfoset/QtnFastInfosetVocabulary.h
            src/fastinfoset/QtnFastInfosetEncoder.h
            src/fastinfoset/QtnFastInfosetDecoder.h
            src/fastinfoset/QtnFastInfosetStreamWriterPrivate.h
            src/fastinfoset/QtnFastInfosetStreamReaderPrivate.h

            # ALL_SOURCES
            src/fastinfoset/QtnFastInfosetUtils.cpp
            src/fastinfoset/QtnFastInfosetAlgorithms.cpp
            src/fastinfoset/QtnFastInfosetVocabulary.cpp
            src/fastinfoset/QtnFastInfosetEncoder.cpp
            src/fastinfoset/QtnFastInfosetDecoder.cpp
            src/fastinfoset/QtnFastInfosetStreamWriter.cpp
            src/fastinfoset/QtnFastInfosetStreamReader.cpp
            src/fastinfoset/QtnFastInfosetConsts.cpp
    )

endfunction()
