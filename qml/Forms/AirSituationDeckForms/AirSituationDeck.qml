import QtQuick 2.12
import QtQml.Models 2.12
import StyleConstants 1.0
import FlightPlansListModel 1.0

Item {
    id: _airSituationDeck

    AirSituationDeckPinArea {
        id: _leftPinArea
        z: 5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8
    }

    AirSituationDeckPinArea {
        id: _rightPinArea
        z: 5
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8
    }

    DropArea {
        id: _centralDropArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        keys: ["plate"]

        onDropped: {
            var src = drop.source
            src.parent = _airSituationDeck
            src.pinned = false
        }
    }

    Component.onCompleted: {

    }

    FlightPlansPlate {
        z: 50
        title: "Arrival"
        x: 300; y: 300
        pinnedColor: StyleConstants.arrivalPinnedColor
        unpinnedColor: StyleConstants.arrivalUnpinnedColor
        model: FlightPlansListModel{}
    }

    FlightPlansPlate {
        z: 50
        title: "Departure"
        x: 200; y: 200
        pinnedColor: StyleConstants.departurePinnedColor
        unpinnedColor: StyleConstants.departureUnpinnedColor
        model: FlightPlansListModel{}
    }

    FlightPlansPlate {
        z: 50
        title: "Taxi"
        x: 200; y: 200
        pinnedColor: StyleConstants.taxiPinnedColor
        unpinnedColor: StyleConstants.taxiUnpinnedColor
        model: FlightPlansListModel{}
    }
}
