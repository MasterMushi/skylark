import QtQuick 2.0
import QtQuick.Controls 2.12
import StyleConstants 1.0
import Texts 1.0
import Managers 1.0

AbstractButton {
    id: root

    contentItem:
        CustomMenuText {
            id: _text

            property var locale: Qt.locale()

            text: GeneralTimeManager.currentDate.toLocaleString(locale, "yyyy  /  MM  /  dd")
            color: StyleConstants.greyTextColor
        }

    ToolTip {
        id: _tooltip
        parent: root
        visible: root.hovered
        text: "tool tip"

        background: Item {

            Rectangle {
                radius: StyleConstants.toolBarPopupRadius
            }

        }
    }

}
