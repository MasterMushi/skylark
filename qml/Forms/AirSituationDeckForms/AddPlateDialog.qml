import QtQuick 2.12
import QtQuick.Layouts 1.12
import Forms.AbstractForms 1.0
import StyleConstants 1.0
import Texts 1.0

AbstractDialog {

    id: root

    property bool rightPinArea: true

    title: "Open new window"
    width: 322
    height: _listView.contentHeight + header.height


    contentItem: ListView {

        id: _listView
        clip: true
        interactive: false
        highlightFollowsCurrentItem: true

        model: ListModel {

            id: _model
            Component.onCompleted: {
                append({ "plate": _arrivalPlate });
                append({ "plate": _flightPlansPlate });
                append({ "plate": _runwaysPlate });
                append({ "plate": _weatherPlate });
                append({ "plate": _departurePlate });
                append({ "plate": _pushBackPlate });
                append({ "plate": _taxiPlate });
                append({ "plate": _otherPlate });
            }
        }

        delegate: AbstractListViewDelegate {

            id: _delegate

            width: root.width
            height: visible ? 48 : 0
            visible: !plate.visible

            modelCount: _model.count
            topRadius: false

            contentItem: RowLayout {

                spacing: 14.93

                Rectangle {
                    width: 20
                    height: width
                    Layout.alignment: Qt.AlignVCenter
                    radius: width / 2
                    color: plate.pinnedColor.toString()
                }

                CustomMenuText {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    text: plate.title
                    color: _delegate.highlighted ? StyleConstants.whiteTextColor : StyleConstants.greyTextColor
                    elide: Text.ElideRight
                }
            }

            onHoveredChanged: highlighted = hovered
            onClicked: function addPlate() {
                if(root.rightPinArea)
                    _rightPinArea.pinToArea(plate)
                else
                    _leftPinArea.pinToArea(plate)
                plate.visible = true
                root.close()
            }
        }

        MouseArea {

            id: _listViewMouseArea
            anchors.fill: parent
            onPressed:  mouse.accepted = false
            cursorShape: Qt.PointingHandCursor
        }
    }

}
