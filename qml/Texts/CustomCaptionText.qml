import QtQuick 2.12
import StyleConstants 1.0
import ResourceProvider 1.0

Text {
    text: "Caption"
    color: StyleConstants.captionTextColor

    font.family: Resources.fonts.fontLatoRegularLoader.name
    font.pixelSize: StyleConstants.captionTextPixelSize

    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter
}
