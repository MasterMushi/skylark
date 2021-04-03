import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

AbstractToolBarButton {
    id: root
    width: 151
    height: 24

    property bool statusIsOk: true

    palette {
        base: StyleConstants.darkBaseColor
        highlight: StyleConstants.highlightColor
    }

    contentItem: Item {
        anchors.fill: parent

        RowLayout {
        anchors.fill: parent
        spacing: 12

            Image {
                id: _image
                fillMode: Image.Pad
                source: statusIsOk ? Resources.icons.sysGreen : Resources.icons.sysRed
            }

            CustomMenuText {
                id: _text
                text: "System Status"
                color: (root.hovered & root.enabled) ? palette.highlightedText : palette.text
            }
        }
    }
}
