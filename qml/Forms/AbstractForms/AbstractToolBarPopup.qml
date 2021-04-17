import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import Shapes 1.0
import StyleConstants 1.0

Popup {
    id: root

    horizontalPadding: 20
    topPadding: _triangle.height
    bottomPadding: 10
    topInset: 0

    height: topPadding + contentItem.implicitHeight + bottomPadding

    background: ColumnLayout {

        id: _background
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
            clip: true

            RadialGradient {
                anchors.fill: parent
                horizontalRadius: parent.width * 5 / 7
                verticalRadius: parent.height * 7 / 9
                gradient: Gradient {
                    GradientStop { position: 0.8; color: "transparent"}
                    GradientStop { position: 0.0; color: "#35000000"}
                }
            }


        }
    }
}
