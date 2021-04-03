import QtQuick 2.0
import QtQuick.Controls 2.12
import StyleConstants 1.0
import Texts 1.0
import ResourceProvider 1.0

TextField {
    id: root

    implicitWidth: 200
    implicitHeight: StyleConstants.formImplicitHeight

    font.family: Resources.fonts.fontLatoRegularLoader.name
    font.pixelSize: StyleConstants.captionTextPixelSize
    placeholderText: StyleConstants.placeHolderTextColor

    maximumLength: root.width / root.font.pointSize

    onActiveFocusChanged: {if (activeFocus) {text = ""}}
    Keys.onReturnPressed: nextItemInFocusChain().forceActiveFocus()

    background: Rectangle {
        id: _background
        anchors.fill: parent

        border.width: StyleConstants.formBorderBaseWidth
        border.color: StyleConstants.formBorderBaseColor
        radius: StyleConstants.formRadius
    }

    states: [
        State {
            name: "active"
            when: root.activeFocus
            PropertyChanges {
                target: _background
                border.width: StyleConstants.formBorderActiveWidth
                border.color: StyleConstants.formBorderActiveColor
            }
        }
    ]
}
