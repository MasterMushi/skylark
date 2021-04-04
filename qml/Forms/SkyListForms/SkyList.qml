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

    property real previousX
    property real previousY

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

            MouseArea {
                anchors.fill: parent
                drag.target: root
                drag.minimumX: root.parent.x
                drag.maximumX: root.parent.width - root.width
                drag.minimumY: root.parent.y
                drag.maximumY: root.parent.height - root.height
            }

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

            }
        }
    }


    contentItem: ListView {
        implicitHeight: contentHeight
        delegate: SkyListItemDelegate { }
        spacing: 1
        interactive: false
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
