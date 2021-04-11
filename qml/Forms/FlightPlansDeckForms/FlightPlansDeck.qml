import QtQuick 2.12
import QtQml.Models 2.12
import StyleConstants 1.0
import FlightPlansListModel 1.0

Item {
    id: root

    FlightPlansDeckPinArea {
        id: _leftPinArea
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8
        height: parent.height
    }

    FlightPlansDeckPinArea {
        id: _rightPinArea
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8
        height: parent.height
    }

    DropArea {
        id: _centralDropArea
        anchors.left: _leftPinArea.right
        anchors.right: _rightPinArea.left
        anchors.top: root.top
        anchors.bottom: root.bottom
        keys: ["pinned", "rightPinned"]

        onDropped: {
            var src = drop.source
            var rp = mapFromItem(_leftPinArea, src.x, src.y)
            src.parent = _centralDropArea
            src.x = rp.x
            src.y = rp.y

            src.pinned = false
        }

        FlightPlansPlate {
            title: "Arrival"
            x: 300; y: 300
            pinnedColor: StyleConstants.arrivalPinnedColor
            unpinnedColor: StyleConstants.arrivalUnpinnedColor
            model: FlightPlansListModel{}
            dragMinimumX: root.x
            dragMaximumX: root.width
        }

        FlightPlansPlate {
            title: "Departure"
            x: 200; y: 200
            pinnedColor: StyleConstants.departurePinnedColor
            unpinnedColor: StyleConstants.departureUnpinnedColor
            model: FlightPlansListModel{}
            dragMinimumX: root.x
            dragMaximumX: root.width
        }
    }
}
