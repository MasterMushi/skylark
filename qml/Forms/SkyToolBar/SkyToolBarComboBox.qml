import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

ComboBox {
    id: root

//    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
//                            implicitContentWidth + leftPadding + rightPadding)
//    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
//                             implicitContentHeight + topPadding + bottomPadding,
//                             implicitIndicatorHeight + topPadding + bottomPadding)

//    leftPadding: padding + (!root.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
//    rightPadding: padding + (root.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    Component.onCompleted: { currentIndex = 0 }

    textRole: "text"

    contentItem: Image {
        id: _currentImage
        fillMode: Image.Pad
        source: root.model.get(currentIndex)["img"]
        opacity: _delegate.down ? 1 : 0.7
    }

    indicator: Image {
        id: _indicator
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 12
        source: Resources.icons.chevroneDown
        opacity: _delegate.down ? 1 : 0.7
    }

    background: Rectangle {
        implicitWidth: 72
        implicitHeight: 40
        radius: StyleConstants.toolBarFormsRadius

        color: (root.hovered || root.down) ? StyleConstants.highlightColor : StyleConstants.buttonBaseColor
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
            implicitWidth: 160
            implicitHeight: 48
            color: _delegate.highlighted ? StyleConstants.highlightColor : StyleConstants.darkBaseColor
        }
    }

    popup: AbstractToolBarPopup {
        id: _popup
        x: root.x
        y: root.y + root.height

        palette.base: StyleConstants.darkBaseColor

        width: 160
        //height: contentItem.implicitHeight + topPadding

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.delegateModel
            currentIndex: root.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                id: _rectangle
                z: 10
                radius: StyleConstants.toolBarPopupRadius
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: "transparent"
            }
        }
    }
}
