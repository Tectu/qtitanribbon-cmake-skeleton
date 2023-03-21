list(APPEND HEADERS_PUBLIC
    src/ribbon/QtnRibbonDef.h
    src/ribbon/QtnRibbonSliderPane.h
    src/ribbon/QtnRibbonStatusBar.h
    src/ribbon/QtnRibbonSearchBar.h
    src/ribbon/QtnRibbonTabBar.h
    src/ribbon/QtnRibbonSystemMenu.h
    src/ribbon/QtnRibbonPage.h
    src/ribbon/QtnRibbonGroup.h
    src/ribbon/QtnRibbonBar.h
    src/ribbon/QtnRibbonButton.h
    src/ribbon/QtnRibbonMainWindow.h
    src/ribbon/QtnRibbonControls.h
    src/ribbon/QtnRibbonButtonControls.h
    src/ribbon/QtnRibbonInputControls.h
    src/ribbon/QtnRibbonGalleryControls.h
    src/ribbon/QtnRibbonQuickAccessBar.h
    src/ribbon/QtnOfficePopupColorButton.h
    src/ribbon/QtnRibbonGallery.h
    src/ribbon/QtnOfficePopupMenu.h
    src/ribbon/QtnRibbonBackstageView.h
    src/ribbon/QtnOfficePopupWindow.h
    src/ribbon/QtnRibbonWorkspace.h
    src/ribbon/QtnRibbonCustomizeDialog.h
    src/ribbon/QtnRibbonCustomizePage.h
    src/ribbon/QtnRibbonCustomizeManager.h
)

function(qtn_component_ribbon_target_setup TARGET)

    target_include_directories(
        ${TARGET}
        PRIVATE
            src/ribbon
    )

    target_sources(
        ${TARGET}
        PRIVATE
            # PUBLIC_HEADAERS
            ${HEADERS_PUBLIC}

            # PRIVATE_HEADERS
            src/ribbon/QtnRibbonBarPrivate.h
            src/ribbon/QtnRibbonPagePrivate.h
            src/ribbon/QtnRibbonGroupPrivate.h
            src/ribbon/QtnRibbonStatusBarPrivate.h
            src/ribbon/QtnRibbonGalleryPrivate.h
            src/ribbon/QtnRibbonBackstageViewPrivate.h
            src/ribbon/QtnRibbonSliderPanePrivate.h
            src/ribbon/QtnRibbonSystemMenuPrivate.h
            src/ribbon/QtnRibbonTitleBarWidgetPrivate.h
            src/ribbon/QtnRibbonQuickAccessBarPrivate.h
            src/ribbon/QtnRibbonButtonPrivate.h
            src/ribbon/QtnRibbonControlsPrivate.h
            src/ribbon/QtnRibbonKeyTipPrivate.h
            src/ribbon/QtnRibbonCustomizeDialogPrivate.h
            src/ribbon/QtnRibbonCustomizeManagerPrivate.h
            src/ribbon/QtnPopupHelpers.h

            # ALL_SOURCES
            src/ribbon/QtnRibbonButton.cpp
            src/ribbon/QtnRibbonPopup.cpp
            src/ribbon/QtnRibbonSliderPane.cpp
            src/ribbon/QtnRibbonStatusBar.cpp
            src/ribbon/QtnRibbonSearchBar.cpp
            src/ribbon/QtnRibbonTabBar.cpp
            src/ribbon/QtnRibbonSystemMenu.cpp
            src/ribbon/QtnRibbonPage.cpp
            src/ribbon/QtnRibbonGroup.cpp
            src/ribbon/QtnRibbonBar.cpp
            src/ribbon/QtnRibbonMainWindow.cpp
            src/ribbon/QtnRibbonTitleBarWidget.cpp
            src/ribbon/QtnRibbonControls.cpp
            src/ribbon/QtnRibbonButtonControls.cpp
            src/ribbon/QtnRibbonInputControls.cpp
            src/ribbon/QtnRibbonGalleryControls.cpp
            src/ribbon/QtnRibbonKeyTip.cpp
            src/ribbon/QtnRibbonQuickAccessBar.cpp
            src/ribbon/QtnOfficePopupColorButton.cpp
            src/ribbon/QtnRibbonGallery.cpp
            src/ribbon/QtnOfficePopupMenu.cpp
            src/ribbon/QtnRibbonBackstageView.cpp
            src/ribbon/QtnOfficePopupWindow.cpp
            src/ribbon/QtnRibbonWorkspace.cpp
            src/ribbon/QtnRibbonCustomizeDialog.cpp
            src/ribbon/QtnRibbonCustomizePage.cpp
            src/ribbon/QtnRibbonCustomizeManager.cpp
            src/ribbon/QtnRibbonDef.cpp
            src/ribbon/QtnPopupHelpers.cpp

            # Forms
            src/ribbon/QtnRibbonRenameDialog.ui
            src/ribbon/QtnRibbonQuickAccessBarCustomizePage.ui
            src/ribbon/QtnRibbonBarCustomizePage.ui

            # Resources
            src/ribbon/QtnRibbonResources.qrc
            src/ribbon/QtnRibbonTranslations.qrc
    )

endfunction()
