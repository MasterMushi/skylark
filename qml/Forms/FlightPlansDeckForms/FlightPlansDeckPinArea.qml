import QtQuick 2.0

Item {
    id: root

    property int pinMinimumWidth: 8

    DropArea {
        id: _dropArea

        height: parent
        width: 8
    }

    Rectangle {
        id: _pinRectangle
        visible: true

        Column {

        }
    }
}
