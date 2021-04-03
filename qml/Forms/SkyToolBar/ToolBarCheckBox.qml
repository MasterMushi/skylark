import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

ComboBox {
    id: root

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!root.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (root.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    Component.onCompleted: {currentIndex = 0}

    textRole: "text"

    contentItem: Image {
        id: _currentImage
        fillMode: Image.Pad
        source: root.model.get(currentIndex)["img"]
        opacity: _delegate.down ? 1 : 0.7
    }

    indicator: Image {
        id: _indicator
        //anchors.verticalCenter: root.verticalCenter
        //anchors.right: root.right
        //anchors.rightMargin: 6
        source: Resources.icons.chevroneDown
        opacity: _delegate.down ? 1 : 0.7
    }

    background: Rectangle {
        implicitWidth: 72
        implicitHeight: 40
        radius: StyleConstants.comboBoxRadius

        color: root.down ? StyleConstants.highlightColor : StyleConstants.buttonBaseColor
        border.color: root.palette.highlight
        border.width: !root.editable && root.visualFocus ? 2 : 0
        visible: !root.flat || root.down
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

    popup: Popup {
        id: _popup
        x: root.x
        y: root.y + root.height
        topPadding: 7
        leftPadding: 0
        width: 160
        height: Math.min(contentItem.implicitHeight, root.Window.height - topMargin - bottomMargin)

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.delegateModel
            currentIndex: root.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                id: _rectangle
                z: 10
                radius: 12
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: "transparent"
            }
        }

        background: Item {

            Shape {
                x: parent.x + 42
                y: parent.y + 7

                ShapePath {
                    strokeColor: StyleConstants.darkBaseColor
                    strokeWidth: 0
                    fillColor: StyleConstants.darkBaseColor
                    strokeStyle: ShapePath.RoundCap
                    startX: parent.x; startY: parent.y
                    PathLine { id: pl1; x: parent.x + 5.5; y: parent.y - 7 }
                    PathLine { id: pl2; x: pl1.x + 5.5; y: pl1.y + 7 }
                    PathLine { id: pl3; x: parent.x; y: parent.y}
                }
            }

            Rectangle {
                anchors.fill: parent
                color: "transparent"
                radius: 12
            }
        }
    }
}
