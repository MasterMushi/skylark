import QtQuick 2.0
import QtQuick.Controls 2.12
import StyleConstants 1.0

AbstractButton {
    id: root

    property alias backgroundColor: _background.color

    palette {
        highlightedText: StyleConstants.whiteTextColor
        text: StyleConstants.greyTextColor
        highlight: StyleConstants.highlightColor
    }

    background: Rectangle {
        id: _background
        implicitWidth: root.width
        implicitHeight: root.height
        radius: StyleConstants.toolBarFormsRadius
        color: (root.hovered & root.enabled) ? palette.highlight : (root.down ? palette.dark : palette.base)
    }

    contentItem: Image {
        id: _icon
        fillMode: Image.Pad
        source: root.icon.source
        opacity: (root.hovered & root.enabled) ? 1 : 0.7
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        onPressed:  mouse.accepted = false
        cursorShape: Qt.PointingHandCursor
    }
}
