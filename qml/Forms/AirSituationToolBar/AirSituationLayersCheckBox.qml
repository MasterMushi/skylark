import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import Forms.AbstractForms 1.0
import ResourceProvider 1.0
import StyleConstants 1.0
import Texts 1.0
import QtGraphicalEffects 1.12

AirSituationPointerComboBox {
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

    delegate: AbstractListViewDelegate {
        id: _delegate

        width: _popup.width - _popup.horizontalPadding * 2

        modelCount: root.model.count
        contentItem: RowLayout {
            spacing: 14.93

            Image {
                Layout.alignment: Qt.AlignVCenter
                source: check ? Resources.icons.checkboxCheck : Resources.icons.checkboxEmpty
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

        onClicked: check = !check
    }

    popup {
        id: _popup
        width: 255

    }
}
