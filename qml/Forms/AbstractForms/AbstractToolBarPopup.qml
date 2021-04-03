import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Shapes 1.0
import StyleConstants 1.0

Popup {
        id: root

        topInset: 0
        horizontalPadding: 0
        topPadding: _triangle.height
        bottomPadding: 0

        height: topPadding + contentItem.implicitHeight


        background: ColumnLayout {
            anchors.fill: parent

            PopupTriangle {
                id: _triangle
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: root.parent.width / 2
                color: root.palette.base
            }

            Rectangle {
                id: _rectangle
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft
                color: "transparent"
                radius: StyleConstants.toolBarPopupRadius
            }
        }
    }
