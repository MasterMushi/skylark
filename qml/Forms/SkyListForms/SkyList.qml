import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.CommonForms 1.0
import StyleConstants 1.0
import Texts 1.0

Control {
    id: root
    width: 412

    property string name: "List Title"
    property bool pinned: false

    property alias backgroundColor: _background.color

    horizontalPadding: 4
    bottomPadding: 4
    topPadding: 38


    background: Rectangle {
        id: _background
        radius: StyleConstants.toolBarPopupRadius
        color: StyleConstants.arrivalListColor

        Rectangle {
            id: _header
            width: parent.width
            height: root.topPadding
            color: "transparent"
            layer.enabled: true

            CustomMenuText {
                id: _title
                anchors.centerIn: parent
                text: root.name
                horizontalAlignment: Text.AlignHCenter
            }

            CrossIndicator {
                id: _closeIndicator
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: parent.height / 2 - height / 2
                anchors.rightMargin: anchors.topMargin
                Component.onCompleted: console.log(parent.height, height, anchors.topMargin)
            }
        }
    }


    contentItem: ListView {
        implicitHeight: contentHeight
        delegate: SkyListItemDelegate { }
        spacing: 1
        model: ListModel {

            ListElement {
                text1: "FFT2323"
                text2: "B738 - M"
                text3: "0000"
            }

            ListElement {
                text1: "RPA4543"
                text2: "A832 - M"
                text3: "0000"
            }
        }
    }
}
