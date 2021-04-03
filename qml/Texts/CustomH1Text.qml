import QtQuick 2.12
import StyleConstants 1.0
import ResourceProvider 1.0

Text {
    text: "Header1"
    color: StyleConstants.h1TextColor

    font.family: Resources.fonts.fontLatoBoldLoader.name
    font.pixelSize: StyleConstants.h1TextPixelSize
    font.bold: true

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}
