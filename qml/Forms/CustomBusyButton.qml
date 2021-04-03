import QtQuick 2.12
import QtQuick.Controls 2.12
import StyleConstants 1.0
import Forms 1.0
import Texts 1.0
import ResourceProvider 1.0

Control {
    id: root

    property alias text: _text.text
    property bool isBusy: false
    signal clicked()

    focus: true
    focusPolicy: Qt.TabFocus

    background: Rectangle {
        id: _background
        implicitWidth: StyleConstants.formImplicitWidth
        implicitHeight: StyleConstants.formImplicitHeight

        radius: StyleConstants.formRadius
        color: StyleConstants.buttonBaseColor
    }

    contentItem: Item {
        id: _contentItem
        property bool showIndicator: false

        CustomButtonText {
            id: _text
            anchors.centerIn: parent
            visible: !parent.showIndicator
            text: "Text"
        }

        CustomBusyIndicator {
            id: _busyIndicator
            anchors.centerIn: parent
            dark: false
            visible: parent.showIndicator
            running: parent.showIndicator
        }
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        hoverEnabled: true

        enabled: !root.isBusy
        onClicked: root.clicked()
        cursorShape: Qt.PointingHandCursor
    }

    Keys.onReturnPressed: root.clicked()

    states: [
        State {
            name: "busy"
            when: root.isBusy
            extend: "clicked"
            PropertyChanges {
                target: _contentItem;
                showIndicator: true
            }
        },

        State {
          name: "clicked"
          when: _mouseArea.pressed
          PropertyChanges {
              target: _background
              color: StyleConstants.buttonActiveColor
          }
        },

        State {
            name: "entered"
            when: _mouseArea.containsMouse || root.activeFocus
            PropertyChanges {
                target: _background;
                color: StyleConstants.buttonFocusColor
            }
        }
    ]
}
