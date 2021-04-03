import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0
import Texts 1.0

Item {
    id: root

    property string icon
    property string text

    RowLayout {
        anchors.fill: parent
        spacing: 12

        Image {
            id: _icon
            source: root.icon
        }

        CustomMenuText {
            text: root.text
        }
    }
}
