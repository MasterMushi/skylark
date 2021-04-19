import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import Forms.CommonForms 1.0
import StyleConstants 1.0
import Texts 1.0
import QtQuick.Window 2.12

Control {
    id: root
    implicitWidth: 412
    implicitHeight: 200

    property string title: _content.model.title
    property color pinnedColor
    property color unpinnedColor
    property alias model: _content.model

    property int pinPosition: -1
    property bool pinned: false
    property bool inPinArea: false

    Drag.active: _dragArea.drag.active
    Drag.keys: "plate"
    Drag.hotSpot.x: ((root.x + width / 2) < root.parent.width / 2) ? 0 : width
    Drag.hotSpot.y: 0

    z: Drag.active ? 100 : 0
    horizontalPadding: 4
    bottomPadding: 4
    topPadding: 38

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

                cursorShape: Qt.PointingHandCursor

                drag.target: root
                drag.minimumX: ((root.x + width / 2) < root.parent.width / 2) ? 0 : drag.minimumX
                drag.maximumX: ((root.x + width / 2) < root.parent.width / 2) ? 3000 : root.parent.width - root.width
                drag.minimumY: root.parent.y
                drag.maximumY: root.parent.height - root.height

                onReleased: root.Drag.drop()
                onPositionChanged: unpin()

                function unpin() {
                    if (root.parent !== _airSituationDeck) {
                        root.x = mapToItem(_airSituationDeck, root.x, root.y).x
                        root.parent = _airSituationDeck
                        root.height = Math.min(root.implicitHeight, 200)
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

                onClicked: root.visible = false
            }

            AddIndicator {
                id: _addIndicator
                visible: false
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: parent.height / 2 - height / 2
                anchors.rightMargin: anchors.topMargin

                onClicked: _addPlateDialog.open()
            }
        }

        Rectangle {
            id: _substr
            z: -5
            anchors.fill: parent
            color: "transparent"
        }
    }

    contentItem: ColumnLayout {
        id: _contentLayout
        spacing: 1
        clip: true

        ListView {
            id: _content
            Layout.fillWidth: true
            Layout.minimumHeight: Math.min(parent.height, contentHeight)

            spacing: 1
            interactive: true
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            delegate: FlightPlansStrip {
                id: _delegate
                pinned: root.pinned

            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 200 }
            }
        }

        Rectangle {
            id: _downGround
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: StyleConstants.blackColor
            opacity: 0.75
        }
    }

    DropArea {
        id: _stripDropArea
        anchors.fill: parent
        keys: "strip"
        onDropped: {
            if (drop.text !== title)
                airSituationViewModel.changeFilter(drop.text, title);
        }
    }

    states: [
        State {
            name: "pinned"
            when: root.pinned

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
                opacity: 1
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
