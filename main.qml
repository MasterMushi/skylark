import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.15
import Forms.SkyWindowHeader 1.0
import StyleConstants 1.0
import Views 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 680
    title: qsTr("SkyLark")
    flags: Qt.Window | Qt.FramelessWindowHint

    property int previousX
    property int previousY

    property int xUntilDoubleClicked
    property int yUntilDoubleClicked
    property int widthUntilDoubleClicked
    property int heightUntilDoubleClicked

    SkyWindowHeader {
        id: _menuBar
        width: parent.width
        height: 38
        anchors.top: parent.top


        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                if (root.width < Screen.width || root.height < Screen.height)
                {
                    root.xUntilDoubleClicked = root.x; root.setX(0)
                    root.yUntilDoubleClicked = root.y; root.setY(0)
                    root.widthUntilDoubleClicked = root.width; root.width = Screen.width
                    root.heightUntilDoubleClicked = root.height; root.height = Screen.height
                }
                else
                {
                    root.setX(root.xUntilDoubleClicked)
                    root.setY(root.yUntilDoubleClicked)
                    root.width = root.widthUntilDoubleClicked
                    root.height = root.heightUntilDoubleClicked
                }
            }

            onPressed: {
                previousX = mouseX
                previousY = mouseY
            }

            onMouseXChanged: {
                var dx = mouseX - previousX
                root.setX(root.x + dx)
            }

            onMouseYChanged: {
                var dy = mouseY - previousY
                root.setY(root.y + dy)
            }
        }
    }

    MouseArea {
        z: 100
        width: 5
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeHorCursor

        onPressed: previousX = mouseX
        onMouseXChanged: {
            var dx = mouseX - previousX
            root.setWidth(parent.width + dx)
        }
    }

    MouseArea {
        z: 100
        width: 5
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        cursorShape: Qt.SizeVerCursor

        onPressed: previousY = mouseY
        onMouseXChanged: {
            var dy = mouseY - previousY
            root.setY(root.y + dy)
            root.setHeight(parent.height - dy)
        }
    }

    StackView {
        id: _stack
        anchors.top: _menuBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        initialItem: _loginViewComponent
    }

    Component {
        id: _loginViewComponent

        LoginView {
            id: _loginView
            onLogin: imit.checkLogin(user, pass)
            onLoginSuccess: _stack.push(_airViewComponent);

            loginError: imit.loginError
            loginOk: imit.loginOk
            loginInProgress: imit.isBusy

        }
    }
    Component {
        id: _airViewComponent

        AirView {
            id: _airView

        }
    }
}