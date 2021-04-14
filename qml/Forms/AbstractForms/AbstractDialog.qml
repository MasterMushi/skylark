import QtQuick 2.12
import QtQuick.Controls 2.12
import Forms.CommonForms 1.0
import Texts 1.0
import StyleConstants 1.0

Dialog {
    id: root

    topPadding: 40

    header: Rectangle {
        id: _header
        width: parent.width
        height: root.topPadding
        color: "transparent"

            CustomMenuText {
                id: _title
                anchors.centerIn: parent
                text: root.title
                horizontalAlignment: Text.AlignLeft
                color: StyleConstants.greyTextColor
            }

            CrossIndicator {
                id: _closeIndicator
                visible: true
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
