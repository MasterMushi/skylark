import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0
import Managers 1.0

ToolBar {
    id: root
    palette.base: StyleConstants.darkBaseColor

    signal slCloseClicked()
    signal slMinimizeClicked()
    signal slMaximizeClicked()

    background: Rectangle {
        color: root.palette.base
    }

    StreetLight {
        id: _sl
            z: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 11
            Layout.alignment: Qt.AlignCenter

            onCloseClicked: root.slCloseClicked()
            onMinimizeClicked: root.slMinimizeClicked()
            onMaximizeClicked: root.slMaximizeClicked()
    }

    RowLayout {
        id: _pages

        z: 10
    }

    RowLayout { 
        id: _statusBar

        z: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 11
        Layout.alignment: Qt.AlignRight
        spacing: StyleConstants.skyWindowHeaderSpacing

        enabled: UserManager.userLogined

        AtisButton {
        }

        DateLabel {
        }

        TimeLabel {
        }

        SystemStatusButton {
        }

        UserButton {
        }
    }


}
