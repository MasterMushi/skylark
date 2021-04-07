import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import StyleConstants 1.0
import ResourceProvider 1.0

AirSituationToolBarIconButton {
    id: root

    signal accepted()
    signal declined()

    icon.source: Resources.icons.rbl
    down: _popup.opened

    onClicked: {
        _popup.open()
    }

    Popup {
        id: _popup
        x: root.width + StyleConstants.skyToolBarSpacing / 2
        horizontalPadding: 0
        verticalPadding: 0

        contentItem: RowLayout {
            spacing: 8

            AirSituationToolBarIconButton {
                id: _acceptButton
                Layout.alignment: Qt.AlignVCenter
                palette.base: StyleConstants.darkBaseColor
                icon.source: Resources.icons.check
                onClicked: {
                    root.accepted();
                    _popup.close()
                }
            }

            Rectangle {
                id: _separator
                Layout.alignment: Qt.AlignVCenter
                width: 1
                height: 24
                border.width: 0
                color: "grey"
            }

            AirSituationToolBarIconButton {
                id: _declineButton
                Layout.alignment: Qt.AlignVCenter
                palette.base: StyleConstants.darkBaseColor
                icon.source: Resources.icons.cross
                onClicked: {
                    root.declined();
                    _popup.close()
                }
            }
        }

        background: Rectangle {
            id: _background
            width: _popup.width
            height: _popup.height
            radius: StyleConstants.toolBarFormsRadius
            color: root.palette.dark
        }
    }
}
