import QtQuick 2.0
import QtQuick.Controls 2.12
import StyleConstants 1.0

AbstractButton {
    id: root

    palette {
        highlightedText: StyleConstants.whiteTextColor
        text: StyleConstants.greyTextColor
    }

    background: Rectangle {
        id: _background
        implicitWidth: root.width
        implicitHeight: root.height
        radius: StyleConstants.toolBarFormsRadius
        color: (root.hovered & root.enabled) ? palette.highlight : palette.base
    }

    contentItem: Image {
        id: _icon
        fillMode: Image.Pad
        source: root.icon.source
        opacity: (root.hovered & root.enabled) ? 1 : 0.7
    }
}
