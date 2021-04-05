pragma Singleton
import QtQuick 2.0

Item {
    property bool userLogined: imitLogin.loginOk
    property string currentUser: imitLogin.user

}
