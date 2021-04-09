import QtQuick 2.0
import QtQml.Models 2.12

Item {
    id: root

    property int pinMinimumWidth: 8

    ListView {
        id: _listView
        width: parent.width
        height: parent.height
        model: _itemModel

        DropArea {
            id: _dropArea
            width: parent.width
            height: parent.height
            onDropped: {
                _itemModel.append(drop.source)
                console.log("dropped")
            }
        }
    }

    ObjectModel {
        id: _itemModel

    }
}

