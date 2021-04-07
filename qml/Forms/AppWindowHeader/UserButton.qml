import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0
import Forms.AbstractForms 1.0
import LoginViewModel 1.0

AbstractToolBarButton {
    id: root
    height: 24
    width: 63
    horizontalPadding: 8
    icon.source: Resources.icons.user

    text: LoginViewModel.user

    contentItem: RowLayout {

        Image {
            id: _image
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            source: root.icon.source
        }

        CustomMenuText {
            id: _text
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
            text: root.text
            color: (root.hovered & root.enabled) ? palette.highlightedText : palette.text
        }
    }
}
