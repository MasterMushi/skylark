import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AirSituationToolBar 1.0
import Forms.AirSituationDeckForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0

Page {
    id: airSituationView

    header: AirSituationToolBar {
        id: _airSituationToolBar

        onFlightdataToolBarButtonClicked: {
            _airSituationDeck.flightdataToolBarButtonClicked()
        }
    }

    Item {
        anchors.fill: parent

        AirSituationDeck {
            id: _airSituationDeck
            anchors.fill: parent
        }

        Image {
            id: _mockBackground
            z: -100
            anchors.fill: parent
            source: Resources.icons.screenshot
        }
    }
}
