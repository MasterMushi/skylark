import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AirSituationToolBar 1.0
import Forms.FlightPlansDeckForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import FlightPlansListModel 1.0

Page {
    id: root

    header: AirSituationToolBar { }

    Item {

//        FlightPlansDeck {
//            anchors.fill: parent
//        }

//        FlightPlansDeckPinArea {
//            anchors.left: parent.left
//            anchors.top: parent.top
//            height: parent.height
//        }

        FlightPlansList {
            x: 100
            y: 300
            //backgroundColor: StyleConstants.arrivalListColor
            model: FlightPlansListModel {}
        }

//        FlightPlansList {
//            x: 300
//            y: 400
//            backgroundColor: StyleConstants.departureListColor
//            //name: "Departure"
//            model: FlightPlansListModel {}
//        }

        Image {
            z: -1
            anchors.fill: parent
            source: Resources.icons.screenshot
        }
    }
}
