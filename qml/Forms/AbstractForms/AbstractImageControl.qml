import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import ResourceProvider 1.0

Control {
    id: _control

    property string icon
    property string hoveredIcon: icon
    property bool hoveredOpacity: true

    signal clicked()

    contentItem: Image {
        id: _image
        fillMode: Image.Pad
        source: _control.hovered ? _control.hoveredIcon : _control.icon
        opacity: (_control.hovered && _control.hoveredOpacity) ? 1 : 0.7
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        onPressed:  mouse.accepted = false
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
