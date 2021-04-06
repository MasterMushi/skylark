import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

AbstractToolBarButton {
    id: root
    height: 24
    width: 138
    horizontalPadding: 12

    property bool statusIsOk: true
    text: "System Status"

    palette {
        base: StyleConstants.darkBaseColor
        highlight: StyleConstants.highlightColor
    }

    contentItem: RowLayout {

        Image {
            id: _image
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            source: root.statusIsOk ? Resources.icons.sysGreen : Resources.icons.sysRed
        }

        CustomMenuText {
            id: _text
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
            horizontalAlignment: Text.AlignRight
            text: root.text
            color: (root.hovered & root.enabled) ? palette.highlightedText : palette.text
        }
    }
}
