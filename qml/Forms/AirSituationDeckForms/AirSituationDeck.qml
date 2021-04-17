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

    /************** Plates **************/
    FlightPlansPlate {
        id: _arrivalPlate
        z: Drag.active ? 10 : 5
        title: "Arrival"
        pinnedColor: StyleConstants.arrivalPinnedColor
        unpinnedColor: StyleConstants.arrivalUnpinnedColor
        model: airSituationViewModel.arrivalModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _flightPlansPlate
        z: Drag.active ? 10 : 5
        title: "Flight Plans"
        pinnedColor: StyleConstants.flightPlansPinnedColor
        unpinnedColor: StyleConstants.flightPlansUnpinnedColor
        model: airSituationViewModel.flightPlansModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _runwaysPlate
        z: Drag.active ? 10 : 5
        title: "Runways"
        pinnedColor: StyleConstants.runwaysPinnedColor
        unpinnedColor: StyleConstants.runwaysUnpinnedColor
        model: airSituationViewModel.runwaysModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _weatherPlate
        z: Drag.active ? 10 : 5
        title: "Weather"
        pinnedColor: StyleConstants.weatherPinnedColor
        unpinnedColor: StyleConstants.weatherUnpinnedColor
        model: airSituationViewModel.weatherModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _departurePlate
        z: Drag.active ? 10 : 5
        title: "Departure"
        pinnedColor: StyleConstants.departurePinnedColor
        unpinnedColor: StyleConstants.departureUnpinnedColor
        model: airSituationViewModel.departureModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _pushBackPlate
        z: Drag.active ? 10 : 5
        title: "Push Back"
        pinnedColor: StyleConstants.pushBackPinnedColor
        unpinnedColor: StyleConstants.pushBackUnpinnedColor
        model: airSituationViewModel.pushBackModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _taxiPlate
        z: Drag.active ? 10 : 5
        title: "Taxi"
        pinnedColor: StyleConstants.taxiPinnedColor
        unpinnedColor: StyleConstants.taxiUnpinnedColor
        model: airSituationViewModel.taxiModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }

    FlightPlansPlate {
        id: _otherPlate
        z: Drag.active ? 10 : 5
        title: "Other"
        pinnedColor: StyleConstants.otherPinnedColor
        unpinnedColor: StyleConstants.otherUnpinnedColor
        model: airSituationViewModel.otherModel
        Component.onCompleted: _rightPinArea.pinToArea(this)
    }


    /************** Dialogs **************/
    AddPlateDialog {
        id: _addPlateDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
    }
}
