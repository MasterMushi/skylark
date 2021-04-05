import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0

ToolBar {
    id: root
    palette.base: StyleConstants.darkBaseColor

    signal appCloseClicked()
    signal appMinimizeClicked()
    signal appMaximizeClicked()

    background: Rectangle {
        color: root.palette.base
    }

    StreetLight {
            z: 100
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 11
            Layout.alignment: Qt.AlignCenter
    }

    RowLayout {
        z: 100
        id: _pages
    }

    RowLayout {
        z: 100
        id: _statusBar

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 11
        Layout.alignment: Qt.AlignRight
        spacing: StyleConstants.skyWindowHeaderSpacing

        AtisButton {  }

        DateLabel {  }

        TimeLabel {  }

        SystemStatusButton { }

        UserButton{  }
    }


}
