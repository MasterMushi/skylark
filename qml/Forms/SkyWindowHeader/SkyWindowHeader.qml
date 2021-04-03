import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0

ToolBar {
    id: root
    palette.base: StyleConstants.darkBaseColor

    background: Rectangle {
        color: root.palette.base
    }

    RowLayout {
        id: _appBar
    }

    RowLayout {
        id: _pages
    }

    RowLayout {
        id: _statusBar

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 11
        Layout.alignment: Qt.AlignRight
        spacing: 48

        DateLabel {  }

        TimeLabel {  }

        SystemStatusButton { }


    }


}
