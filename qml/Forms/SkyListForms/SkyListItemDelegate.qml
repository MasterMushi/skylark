import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.CommonForms 1.0


ItemDelegate {
    id: root

    width: 403

    contentItem: RowLayout {
        id: content
        spacing: 8

        DragIndicator {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

        }

        SkyListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 4
            text: text1
        }

        SkyListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 4
            text: text2
        }

        SkyListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            text: text3
        }

        DownArrowIndicator {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
    }

    background: Rectangle {
        color: "black"
        opacity: 0.75
    }
}
