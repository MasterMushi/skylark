import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.CommonForms 1.0
import StyleConstants 1.0
import Texts 1.0
import QtQuick.Window 2.12

Control {
    id: root
    implicitWidth: 412

    property string title: _content.model.title
    required property color pinnedColor
    required property color unpinnedColor
    property alias model: _content.model

    property int pinPosition: -1
    property bool pinned: false
    property bool inPinArea: false

    Drag.active: _dragArea.drag.active
    Drag.keys: "plate"
    Drag.hotSpot.x: ((root.x + width / 2) < root.parent.width / 2) ? 0 : width

    horizontalPadding: 4
    bottomPadding: 4
    topPadding: 38
    clip: true

    palette.highlight: StyleConstants.highlightColor
    background: Rectangle {
        id: _background
        radius: StyleConstants.toolBarPopupRadius
        color: unpinnedColor
        border.width: 4
        border.color: root.inPinArea ? StyleConstants.highlightColor : "transparent"

        Rectangle {
            id: _header
            width: parent.width
            height: root.topPadding
            color: "transparent"

            MouseArea {
                id: _dragArea
                anchors.fill: parent
                drag.target: root
                drag.minimumX: ((root.x + width / 2) < root.parent.width / 2) ? 0 : drag.minimumX
                drag.maximumX: ((root.x + width / 2) < root.parent.width / 2) ? 1920 : root.parent.width - root.width
                drag.minimumY: root.parent.y
                drag.maximumY: root.parent.height - root.height

                onReleased: root.Drag.drop()
                onPositionChanged: {
                    if (root.parent !== _airSituationDeck) {
                        root.x = mapToItem(_airSituationDeck, root.x, root.y).x
                        root.parent = _airSituationDeck
                        root.height = root.implicitHeight
                    }
                }
            }

            CustomMenuText {
                id: _title
                anchors.centerIn: parent
                text: root.title
                horizontalAlignment: Text.AlignHCenter
                color: root.Drag.active ? StyleConstants.whiteTextColor : StyleConstants.greyTextColor
            }

            CrossIndicator {
                id: _closeIndicator
                visible: true
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: parent.height / 2 - height / 2
                anchors.rightMargin: anchors.topMargin
            }

            AddIndicator {
                id: _addIndicator
                visible: false
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: parent.height / 2 - height / 2
                anchors.rightMargin: anchors.topMargin
            }
        }

        Rectangle {
            z: -5
            id: _substr
            anchors.fill: parent
            color: "transparent"
        }
    }

    contentItem: ColumnLayout {
        spacing: 1
        ListView {
            id: _content
            Layout.fillWidth: true
            implicitHeight: contentHeight
            implicitWidth: contentWidth
            delegate: FlightPlansPlateItemDelegate {
                id: _delegate
                pinned: root.pinned
            }
            spacing: 1
            interactive: true
            clip: true
        }

        Rectangle {
            id: _downGround
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
        }
    }

    states: [
        State {
            name: "pinned"
            when: root.pinned
            PropertyChanges {
                target: root

            }
            PropertyChanges {
                target: _background
                radius: 0
                color: pinnedColor
            }
            PropertyChanges {
                target: _substr
                color: StyleConstants.darkBaseColor
            }
            PropertyChanges {
                target: _downGround
                color: StyleConstants.darkBaseColor
            }
            PropertyChanges {
                target: _addIndicator
                visible: true
            }
            PropertyChanges {
                target: _closeIndicator
                visible: false
            }
        }
    ]
}
