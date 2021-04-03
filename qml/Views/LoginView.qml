import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import StyleConstants 1.0
import Forms 1.0
import Texts 1.0

Page {
    id: root

    property bool loginError: false
    property bool loginOk: false
    property bool loginInProgress: false

    signal login(string user, string pass)
    signal loginSuccess()

    onLoginOkChanged: { if (root.loginOk) { root.loginSuccess() } }

    background: Rectangle {
        id: _background
        color: StyleConstants.backgroundColor
    }

    Rectangle {
        id: _frame
        anchors.centerIn: parent
        width: 512
        height: 412 + root.loginError * 42

        color: StyleConstants.frameColor
        radius: StyleConstants.frameRadius

        ColumnLayout {
            id: _frameLayout
            width: parent.width / 2
            anchors.centerIn: parent
            spacing: StyleConstants.mediumSpacing

            CustomH1Text {
                id: _header1
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: _frame.width / 2

                text: "WP Login"
            }

            ColumnLayout {
                id: _frameControls
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: _frame.width / 2

                spacing: StyleConstants.mediumSpacing

                CustomCaptionText {
                    id: _loginErrorWarning
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: _frame.width / 2

                    text: "Invalid Login and/or Password.\nPlease, try again."
                    color: StyleConstants.warningTextColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    visible: root.loginError
                }

                Column {
                    id: _userColumn
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: _frame.width / 2
                    spacing: StyleConstants.minimumSpacing

                    CustomCaptionText {
                        id: _userCaption
                        text: "User"
                    }

                    CustomTextField {
                        id: _userField
                        width: parent.width
                        placeholderText: "AAA"
                        enabled: !root.loginInProgress
                    }
                }

                Column {
                    id: _passColumn
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: _frame.width / 2
                    spacing: StyleConstants.minimumSpacing

                    CustomCaptionText {
                        id: _passCaption
                        text: "Password"
                    }

                    CustomTextField {
                        id: _passField
                        width: parent.width
                        placeholderText: "•••••"
                        echoMode: TextInput.Password
                        enabled: !root.loginInProgress
                        Keys.onReturnPressed: _loginButton.clicked()
                    }
                }

                CustomBusyButton {
                    id: _loginButton
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: _frame.width / 2

                    text: "Login"
                    isBusy: root.loginInProgress

                    onClicked: root.login(_userField.text, _passField.text)
                }
            }
        }
    }
}
