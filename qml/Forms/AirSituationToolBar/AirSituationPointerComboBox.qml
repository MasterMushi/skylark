import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import QtGraphicalEffects 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

ComboBox {
    id: root

    width: 72
    height: 40

    Component.onCompleted: {
        currentIndex = 0
        _model.append({ "text": "Cursor", "img": Resources.icons.pointer });
        _model.append({ "text": "Text", "img": Resources.icons.text });
        _model.append({ "text": "Line", "img": Resources.icons.line });
        _model.append({ "text": "Circle", "img": Resources.icons.circle });
        _model.append({ "text": "Polygon", "img": Resources.icons.polygon });
    }
    textRole: "text"
    down: _popup.opened

    contentItem: Image {
        id: _currentImage
        fillMode: Image.Pad
        source: root.model.get(currentIndex)["img"]
        opacity: (root.hovered || root.down) ? 1 : 0.7
    }

    indicator: Image {
        id: _indicator
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 12
        source: Resources.icons.chevroneDown
        opacity: (root.hovered || root.down) ? 1 : 0.7
    }

    background: Rectangle {
        implicitWidth: 72
        implicitHeight: 40
        radius: StyleConstants.toolBarFormsRadius
        color: (root.hovered & root.enabled) ? StyleConstants.highlightColor : (root.down ? StyleConstants.darkBaseColor : StyleConstants.buttonBaseColor)
    }

    model: ListModel { id: _model }

    delegate: AbstractListViewDelegate {
        id: _delegate

        width: _popup.width - _popup.horizontalPadding * 2

        modelCount: root.model.count
        highlighted: highlightedIndex === index
        contentItem: RowLayout {
            spacing: 14.93

            Image {
                Layout.alignment: Qt.AlignVCenter
                source: img
                smooth: true
                opacity: _delegate.highlighted ? 1 : 0.7
            }

            CustomMenuText {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                text: root.textRole ? (Array.isArray(root.model) ? modelData[root.textRole] : model[root.textRole]) : modelData
                color: _delegate.highlighted ? StyleConstants.whiteTextColor : StyleConstants.greyTextColor
                elide: Text.ElideRight
            }
        }
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        onPressed:  mouse.accepted = false
        cursorShape: Qt.PointingHandCursor
    }

    popup: AbstractToolBarPopup {
        id: _popup
        y: root.y + root.height
        clip: true
        palette.base: StyleConstants.darkBaseColor

        width: 160

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: _popup.visible ? delegateModel : null
            currentIndex: root.highlightedIndex
            highlightMoveDuration: 0
            interactive: false

            MouseArea {
                id: _popupMouseArea
                anchors.fill: parent
                onPressed:  mouse.accepted = false
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
