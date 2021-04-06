import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.SkyToolBar 1.0
import Forms.SkyListForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0

Page {
    id: root

    header: SkyToolBar { }

    Item {
        anchors.fill: parent

        SkyListPinArea {
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height
        }

        SkyList {
            x: 100
            y: 300
            backgroundColor: StyleConstants.arrivalListColor
            name: "Arrival"
        }

        SkyList {
            x: 300
            y: 400
            backgroundColor: StyleConstants.departureListColor
            name: "Departure"
        }

        Image {
            z: -1
            anchors.fill: parent
            source: Resources.icons.screenshot
        }
    }
}
