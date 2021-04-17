import QtQuick 2.12
import QtQuick.Controls 2.12
import Forms.CommonForms 1.0
import Texts 1.0
import StyleConstants 1.0

Dialog {
    id: root

    padding: 0

    header: Rectangle {

        id: _header
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width
        height: 40
        color: "transparent"

        CustomMenuText {

            id: _title
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter

            text: root.title
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            color: StyleConstants.greyTextColor
        }

        CrossIndicator {

            id: _closeIndicator
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: parent.height / 2 - height / 2
            anchors.rightMargin: anchors.topMargin

            onClicked: root.close()
        }
    }

    background: Rectangle {

        id: _background
        color: StyleConstants.darkBaseColor
        radius: StyleConstants.toolBarPopupRadius


    }
}
