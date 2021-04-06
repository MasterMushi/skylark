import QtQuick 2.0
import QtQuick.Controls 2.12
import Forms.AbstractForms 1.0
import StyleConstants 1.0

AbstractToolBarButton {
    implicitWidth: 48
    implicitHeight: 40

    palette {
        base: StyleConstants.lightBaseColor
        dark: StyleConstants.darkBaseColor
        highlight: StyleConstants.highlightColor
    }
}
