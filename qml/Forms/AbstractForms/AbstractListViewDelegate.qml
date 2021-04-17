import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0
import Texts 1.0

ItemDelegate {
    id: root

    property int modelCount: 0
    property bool topRadius: true

    highlighted: ListView.isCurrentItem

    background: Rectangle {

        radius: ((topRadius && index === 0) || index === modelCount - 1) ? StyleConstants.toolBarPopupRadius : 0
        color: parent.highlighted ? StyleConstants.highlightColor : StyleConstants.darkBaseColor

        Rectangle {
            visible: index === 0
            height: parent.radius
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: parent.color
        }

        Rectangle {
            visible: index === modelCount - 1
            height: parent.radius
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            color: parent.color
        }
    }
}
