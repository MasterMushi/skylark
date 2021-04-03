import QtQuick 2.12
import QtQuick.Controls 2.12
import ResourceProvider 1.0

BusyIndicator {
    id: root

    property bool dark: false

    contentItem: Item {
        implicitWidth: 24
        implicitHeight: 24

        Image {
            id: _image
            anchors.fill: parent
            source: root.dark ? Resources.icons.loadingDark : Resources.icons.loadingLight
        }

        Timer {
            id: _rotationTimer
            interval: 80
            repeat: true
            running: root.running
            onTriggered: _image.rotation += 30
        }
    }
}
