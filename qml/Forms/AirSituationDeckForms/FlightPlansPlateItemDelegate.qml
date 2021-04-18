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

    Drag.dragType: Drag.None
    Drag.mimeData: { "text/plain": flight, "strip": "" }
//    Drag.keys: "strip"

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
                onPressed: {
                    drag.target.Drag.active = true
                    drag.target.Drag.startDrag(drag.target.Drag.supportedActions)
                    drag.target.grabToImage(function(result) {
                        drag.target.Drag.imageSource = result.url
                    })
                }
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
