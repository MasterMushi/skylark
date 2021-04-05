import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import ResourceProvider 1.0

Control {
    id: root

    property string icon
    property string hoveredIcon: icon
    property bool hoveredOpacity: true

    signal clicked()

    contentItem: Image {
        id: _image
        fillMode: Image.Pad
        source: root.hovered ? root.hoveredIcon : root.icon
        opacity: (root.hovered && root.hoveredOpacity) ? 1 : 0.7
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onPressed: root.clicked()
    }
}
