import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0

AbstractToolBarButton {
    id: root
    height: 24
    width: 35
    horizontalPadding: 8

    property bool activated: true

    palette {
        base: StyleConstants.darkBaseColor
        highlight: StyleConstants.highlightColor
        midlight: StyleConstants.accentColor
    }

    contentItem: RowLayout {

        Image {
            id: _letter
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            source: Resources.icons.atisLetter
        }

        Image {
            id: _circle
            visible: root.activated
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
            source: Resources.icons.aticeCircle
        }
    }

    backgroundColor: (root.hovered & root.enabled) ? palette.highlight : (root.activated ? palette.midlight : (root.down ? palette.dark : palette.base))
}
