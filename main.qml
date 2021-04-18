import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.15
import Forms.AppWindowHeader 1.0
import StyleConstants 1.0
import Views 1.0

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1024
    height: 680
    title: qsTr("SkyLark")
    flags: Qt.Window | Qt.FramelessWindowHint

    minimumWidth: 900
    minimumHeight: 480

    property real previousX
    property real previousY

    AppWindowHeader {
        id: _menuBar
        z: 50
        width: parent.width
        height: 38
        anchors.top: parent.top

        onSlCloseClicked: Qt.quit()
        onSlMaximizeClicked: {
            if (appWindow.visibility === Window.Maximized)
                appWindow.showNormal()
            else
                appWindow.showMaximized()
        }
        onSlMinimizeClicked: appWindow.showMinimized()

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                appWindow.visibility === Window.Maximized ? appWindow.showNormal() : appWindow.showMaximized()
            }

            onPressed: {
                previousX = mouseX
                previousY = mouseY
            }

            onMouseXChanged: {
                if (appWindow.visibility !== Window.Maximized)
                {
                    var dx = mouseX - previousX
                    appWindow.setX(appWindow.x + dx)
                }
            }

            onMouseYChanged: {
                if (appWindow.visibility !== Window.Maximized)
                {
                    var dy = mouseY - previousY
                    appWindow.setY(appWindow.y + dy)
                }
            }
        }
    }

    MouseArea {
        id: _rightSizeMouseArea
        z: 100
        width: 4
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeHorCursor
        enabled: appWindow.visibility !== Window.Maximized

        onPressed: previousX = mouseX
        onMouseXChanged: {
            var dx = mouseX - previousX
            if (parent.width > minimumWidth - dx || dx > 0) {
                appWindow.setWidth(parent.width + dx)
            }
        }
    }

    MouseArea {
        id: _leftSizeMouseArea
        z: 100
        width: 4
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeHorCursor
        enabled: appWindow.visibility !== Window.Maximized

        onPressed: previousX = mouseX
        onMouseXChanged: {
            var dx = mouseX - previousX
            if (parent.width > minimumWidth + dx || dx < 0) {
                appWindow.setX(appWindow.x + dx)
                appWindow.setWidth(parent.width - dx)
            }
        }
    }

    MouseArea {
        id: _topSizeMouseArea
        z: 100
        height: 4
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        cursorShape: Qt.SizeVerCursor
        enabled: appWindow.visibility !== Window.Maximized

        onPressed: previousY = mouseY
        onMouseYChanged: {
            var dy = mouseY - previousY
            if (parent.height > minimumHeight + dy || dy < 0) {
                appWindow.setY(appWindow.y + dy)
                appWindow.setHeight(parent.height - dy)
            }
        }
    }

    MouseArea {
        id: _bottomSizeMouseArea
        z: 100
        height: 4
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        cursorShape: Qt.SizeVerCursor
        enabled: appWindow.visibility !== Window.Maximized

        onPressed: previousY = mouseY
        onMouseYChanged: {
            var dy = - mouseY + previousY
            if (parent.height > minimumHeight + dy || dy < 0) {
                appWindow.setHeight(parent.height - dy)
            }
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
            onLogin: loginViewModel.checkLogin(user, pass)
            onLoginSuccess: _stack.push(_airViewComponent);

            loginError: loginViewModel.loginError
            loginOk: loginViewModel.loginOk
            loginInProgress: loginViewModel.isBusy
        }
    }
    Component {
        id: _airViewComponent

        AirSituationView {
            id: _airView
        }
    }
}
