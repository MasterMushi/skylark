import QtQuick 2.0
import QtQuick.Controls 2.12
import StyleConstants 1.0
import Texts 1.0
import Tools 1.0

CustomMenuText {
    id: root

    property var locale: Qt.locale()

    text: GeneralTime.currentDate.toLocaleString(locale, "hh : mm : ss")
}
