import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

ComboBox {
    id: root

    width: 72
    height: 40

    Component.onCompleted: { currentIndex = 0 }
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

    delegate: ItemDelegate {
        id: _delegate

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

        highlighted: highlightedIndex === index

        background: Rectangle {
            implicitWidth: popup.width
            implicitHeight: 48
            radius: (index === 0 || index === root.model.count - 1) ? StyleConstants.toolBarPopupRadius : 0
            color: _delegate.highlighted ? StyleConstants.highlightColor : StyleConstants.darkBaseColor

            Rectangle {
                visible: index === 0
                height: parent.radius
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                color: parent.color
            }

            Rectangle {
                visible: index === root.model.count - 1
                height: parent.radius
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                color: parent.color
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
            model: root.delegateModel
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
