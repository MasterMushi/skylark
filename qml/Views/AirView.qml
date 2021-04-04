import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.SkyToolBar 1.0
import Forms.SkyListForms 1.0
import ResourceProvider 1.0

Page {
    id: root

    header: SkyToolBar { }

    Item {
        anchors.fill: parent

        SkyList {
            x: 100
            y: 300
        }

        Image {
            z: -1
            anchors.fill: parent
            source: Resources.icons.screenshot
        }
    }
}
