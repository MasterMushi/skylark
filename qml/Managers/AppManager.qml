pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.12

Item {
    id: root
    property int appWindowVisibility: Window.AutomaticVisibility

    property bool quitAppWindow: false
    signal cmdQuitAppWindow()
    onQuitAppWindowChanged: {
        root.cmdQuitAppWindow()
        Qt.quit()
    }

    property bool minimizeAppWindow: false
    signal minimizeAppWindow()
    onMinimizeAppWindow: {
        if (appWindowVisibility !== Window.Minimized) {
            minimizeAppWindow()
            minimizeAppWindow = false
        }
    }

    property bool maximizeAppWindow: false
    signal maximizeAppWindow()
    onMaximizeAppWindow: {
        if ((appWindowVisibility !== Window.Maximized) || (appWindowVisibility !== Window.FullScreen)) {
            maximizeAppWindow()
            maximizeAppWindow = false
        }
    }
}
