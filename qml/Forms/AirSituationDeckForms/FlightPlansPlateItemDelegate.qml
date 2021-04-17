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

    Drag.active: _dragArea.drag.active
    Drag.keys: "strip"
    Drag.hotSpot.x: ((root.x + width / 2) < root.parent.width / 2) ? 0 : width
    Drag.dragType: Drag.Automatic
    Drag.mimeData: ["", ""]

    contentItem: RowLayout {
        id: content
        spacing: 8

        DragIndicator {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            MouseArea {
                id: _dragArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                drag.target: root
                onPressed: root.grabToImage(function(result) {
                    root.Drag.imageSource = result.url
                })
            }
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 4
            text: flight
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: width
            text: aircraft
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: width
            text: "—"
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: content.width / 8
            text: letter
        }

        FlightPlansListText {
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            text: number
        }

        DownArrowIndicator {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredWidth: width
        }
    }

    background: Rectangle {
        id: _background
        color: pinned ? StyleConstants.darkBaseColor : StyleConstants.blackColor
        opacity: pinned ? 1.0 : 0.75
    }
}
