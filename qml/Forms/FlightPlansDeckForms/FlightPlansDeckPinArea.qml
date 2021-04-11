import QtQuick 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0

Item {
    id: root

    property bool hasPinned: false

    Rectangle {
        id: _listViewBackground
        z: -1
        width: 8
        height: parent.height
        anchors.left: parent.left
        color: "transparent"

        DropArea {
            id: _dropArea
            width: parent.width
            height: parent.height
            keys: ["unpinned", "pinned", "rightPinned"]

            onEntered: {
                var src = drag.source
                src.dragMinimumX = mapFromItem(src, 0, 0).x
                //src.dragMaximumX = root.width + src.width + 1
            }

            onDropped: {
                var src = drop.source
                var len = _layout.children.length
                var replaceItem = _layout.childAt(src.x, src.y)

                root.width = src.width

                if (replaceItem === null || replaceItem.pinPosition === len) {
                    src.parent = _layout
                    src.pinPosition = len - 1
                }
                else {
                    for (var i = replaceItem.pinPosition; i < len; i++) {
                        var tmp = _layout.children[i]
                    }

                    _layout.children.splice(replaceItem.pinPosition, src)
                }

                src.pinned = true
                src.Layout.alignment = Qt.AlignTop | Qt.AlignLeft
                src.Layout.fillWidth = true
                src.Layout.fillHeight = true
            }
        }

        ColumnLayout {
            id: _layout
            anchors.fill: parent
            spacing: 0
            onChildrenChanged: hasPinned = (children.length > 0)

        }
    }

    states: [
        State {
            name: "hasPinned"
            when: root.hasPinned
            PropertyChanges {
                target: _listViewBackground
                color: StyleConstants.darkBaseColor;
                width: _layout.children[0].width
            }
        },

        State {
            name: "containsDrag"
            when: _dropArea.containsDrag
            PropertyChanges {
                target: _dropArea.drag.source; inPinArea: true
            }
            PropertyChanges {
                target: _listViewBackground; color: StyleConstants.highlightColor
            }
        }
    ]

}
