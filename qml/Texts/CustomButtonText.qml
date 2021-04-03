import QtQuick 2.12
import StyleConstants 1.0
import ResourceProvider 1.0

Text {
    text: "Button"
    color: StyleConstants.buttonTextColor
    
    font.family: Resources.fonts.fontLatoRegularLoader.name
    font.pixelSize: StyleConstants.buttonTextPixelSize
    
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}
