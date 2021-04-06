import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.15
import Forms.AppWindowHeader 1.0
import StyleConstants 1.0
import LoginViewModel 1.0
import Views 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 680
    title: qsTr("SkyLark")
    flags: Qt.Window | Qt.FramelessWindowHint

    property real previousX
    property real previousY

    AppWindowHeader {
        id: _menuBar
        width: parent.width
        height: 38
        anchors.top: parent.top

        onSlCloseClicked: Qt.quit()
        onSlMaximizeClicked: {
            if (root.visibility === Window.FullScreen)
                root.showNormal()
            else
                root.showFullScreen()
        }
        onSlMinimizeClicked: root.showMinimized()

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                root.visibility === Window.FullScreen ? root.showNormal() : root.showFullScreen()
            }

            onPressed: {
                previousX = mouseX
                previousY = mouseY
            }

            onMouseXChanged: {
                if (root.visibility !== Window.FullScreen)
                {
                    var dx = mouseX - previousX
                    root.setX(root.x + dx)
                }
            }

            onMouseYChanged: {
                if (root.visibility !== Window.FullScreen)
                {
                    var dy = mouseY - previousY
                    root.setY(root.y + dy)
                }
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
        height: 5
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
            onLogin: LoginViewModel.checkLogin(user, pass)
            onLoginSuccess: _stack.push(_airViewComponent);

            loginError: LoginViewModel.loginError
            loginOk: LoginViewModel.loginOk
            loginInProgress: LoginViewModel.isBusy
        }
    }
    Component {
        id: _airViewComponent

        AirSituationView {
            id: _airView
        }
    }
}
