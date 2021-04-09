import QtQuick 2.0
import QtQml.Models 2.12

Item {
    id: root

    FlightPlansDeckPinArea {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 10
        height: parent.height
    }

    FlightPlansList { title: "Arrive"; x: 100; y: 100}

    FlightPlansList { title: "Departure"; x: 200; y: 200}
}
