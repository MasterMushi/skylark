import QtQuick 2.12
import QtQml.Models 2.12
import StyleConstants 1.0
//import FlightPlansListModel 1.0

Item {
    id: _airSituationDeck

    AirSituationDeckPinArea {
        id: _leftPinArea
        z: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 8
    }

    AirSituationDeckPinArea {
        id: _rightPinArea
        z: 1
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

    FlightPlansPlate {
        id: _arrival
        z: Drag.active ? 10 : 5
        title: "Arrival"
        pinnedColor: StyleConstants.arrivalPinnedColor
        unpinnedColor: StyleConstants.arrivalUnpinnedColor
        model: airSituationViewModel.arrivalModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _departure
        z: Drag.active ? 10 : 5
        title: "Departure"
        pinnedColor: StyleConstants.departurePinnedColor
        unpinnedColor: StyleConstants.departureUnpinnedColor
        model: airSituationViewModel.departureModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _taxi
        z: Drag.active ? 10 : 5
        title: "Taxi"
        pinnedColor: StyleConstants.taxiPinnedColor
        unpinnedColor: StyleConstants.taxiUnpinnedColor
        model: airSituationViewModel.taxiModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }
}
