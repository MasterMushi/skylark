import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import StyleConstants 1.0

Rectangle {
    id: root

    property bool hasPinned: false

    width: 8
    color: _dropArea.containsDrag ? StyleConstants.highlightColor : "transparent"

    DropArea {
        id: _dropArea
        property QtObject lastDragSource: null
        anchors.fill: parent

        keys: ["plate"]
        onDropped: pinToArea(drop.source)
        onEntered: lastDragSource = drag.source
        onContainsDragChanged: lastDragSource.inPinArea = containsDrag
    }

    Column {
        id: _column
        anchors.fill: root
        spacing: 0

        add: Transition {
            NumberAnimation {properties: "x,y"; duration: 200 }
        }

        move: Transition {
            NumberAnimation {properties: "x,y"; duration: 200 }
        }

        onPositioningComplete: changeChildrenHeight()
        onHeightChanged: changeChildrenHeight()

        function changeChildrenHeight() {
            for (var i = 0; i < _column.children.length; i++) {
                _column.children[i].height = root.height / _column.children.length
            }
        }
    }

    states: [
        State {
            name: "hasPinned"
            when: _column.children.length > 0
            PropertyChanges {
                target: root
                color: StyleConstants.darkBaseColor;
                width: _column.children[0].width
            }
        }
    ]

    function pinToArea(src) {
        src.parent = _column
        src.x = src.parent.x
        src.pinned = true

        _column.forceLayout()
    }
}
