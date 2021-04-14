import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.CommonForms 1.0
import StyleConstants 1.0

ItemDelegate {
    id: root

    property alias backgroundColor: _background.color
    property bool pinned: false

    implicitWidth: 403
    implicitHeight: 38

    contentItem: RowLayout {
        id: content
        spacing: 8

        DragIndicator {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            MouseArea {
                id: _dragArea
                anchors.fill: parent
                drag.target: root

            }
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 4
            text: text1
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 4
            text: text2
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            text: text3
        }

        DownArrowIndicator {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
    }

    background: Rectangle {
        id: _background
        color: pinned ? StyleConstants.darkBaseColor : StyleConstants.blackColor
        opacity: pinned ? 1.0 : 0.75
    }
}
