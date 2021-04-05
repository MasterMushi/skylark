pragma Singleton
import QtQuick 2.0

Timer {
    id: root

    property date currentDate

    interval: 200
    repeat: true
    running: true
    onTriggered: currentDate = new Date()
}
