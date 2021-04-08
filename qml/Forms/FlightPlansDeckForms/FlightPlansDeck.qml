import QtQuick 2.0
import FlightPlanDeckModel 1.0

FlightPlanDeckModel {
    fplists: [
        FlightPlansListModel {
            fplists: [
                FlightPlansListModel {
                    color: "white"
                    Component.onCompleted: {console.log("1:", color, title)}
                },
                FlightPlansListModel {
                    color: "white"
                    Component.onCompleted: {console.log("2:", color, title)}
                },
                FlightPlansListModel {
                    color: "white"
                    Component.onCompleted: {console.log("3:", color, title)}
                }
            ]
        }

    ]
}
