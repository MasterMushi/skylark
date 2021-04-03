import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12


Shape {
    id: root
    width: 11
    height: 7

    property color color: "black"

    ShapePath {
        id: _path
        strokeStyle: ShapePath.FlatCap
        strokeWidth: 0
        fillColor: root.color
        startX: 0; startY: root.height
        PathLine { x: root.width / 2; y: 0 }
        PathLine { x: root.width; y: root.height }
        PathLine { x: _path.startX; y: _path.startY }
    }
}
