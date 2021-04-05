import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Managers 1.0
import ResourceProvider 1.0
import Forms.AbstractForms 1.0

RowLayout {
    spacing: 8

    AbstractImageControl {
        id: _close
        Layout.alignment: Qt.AlignVCenter
        hoveredIcon: Resources.icons.slRed
        icon: Resources.icons.slRed
        onClicked: AppManager.quitAppWindow = true
    }

    AbstractImageControl {
        id: _minimize
        Layout.alignment: Qt.AlignVCenter
        hoveredIcon: Resources.icons.slYellow
        icon: Resources.icons.slYellow
        onClicked: AppManager.minimizeAppWindow = true
    }

    AbstractImageControl {
        id: _maximize
        Layout.alignment: Qt.AlignVCenter
        hoveredIcon: Resources.icons.slGreen
        icon: Resources.icons.slGreen
        onClicked: AppManager.maximizeAppWindow = true
    }
}

