import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0

SkyPointerComboBox {
    id: root

    contentItem: Image {
        id: _currentImage
        fillMode: Image.Pad
        source: Resources.icons.layers
        opacity: (root.hovered || root.down) ? 1 : 0.7
    }

    model: ListModel {
        id: _inspectorComboBoxModel
        Component.onCompleted: {
                    append({ "text": "UIR/FIR", "check": false });
                    append({ "text": "Airports", "check": true });
                    append({ "text": "Restrictive airspace", "check": true });
                    append({ "text": "Controlled airspace", "check": false });
                    append({ "text": "Routes", "check": false });
                    append({ "text": "Navaids", "check": false });
                    append({ "text": "SID", "check": false });
                    append({ "text": "STAR", "check": false });
                    append({ "text": "Approach", "check": false });
        }
    }

    delegate: ItemDelegate {
        id: _delegate

        contentItem: RowLayout {
            spacing: 14.93

            Image {
                Layout.alignment: Qt.AlignVCenter
                source: check ? Resources.icons.checkboxCheck : Resources.icons.checkboxEmpty
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

    popup {
        width: 245
    }

}
