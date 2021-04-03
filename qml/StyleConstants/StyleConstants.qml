pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12

QtObject {
    readonly property real goldenRatio: 1.61

    //forms colors
    readonly property color backgroundColor: "#000000"
    readonly property color lightBaseColor: "#343447"
    readonly property color darkBaseColor: "#22222e"
    readonly property color highlightColor: "#9494ff"
    readonly property color frameColor: "#dddded"

    //text colors
    readonly property color whiteTextColor: "#ffffff"
    readonly property color greyTextColor: "#cecedf"
    readonly property color buttonTextColor: "#ffffff"
    readonly property color captionTextColor: "#0f0f1a"
    readonly property color warningTextColor: "#ed002b"
    readonly property color placeHolderTextColor: "#ababb8"
    readonly property color h1TextColor: "#0f0f1a"
    readonly property color formBorderBaseColor: "#cecedf"
    readonly property color formBorderActiveColor: "#9494ff"

    readonly property color buttonBaseColor: "#343447"
    readonly property color buttonFocusColor: "#565671"
    readonly property color buttonActiveColor: "#0f0f1a"

    readonly property int h1TextPixelSize: 32
    readonly property int captionTextPixelSize: 16
    readonly property int menuTextPixelSize: 16
    readonly property int buttonTextPixelSize: 16

    readonly property real formRadius: 8
    readonly property real frameRadius: 12
    readonly property real toolBarFormsRadius: 4
    readonly property real toolBarPopupRadius: 12

    readonly property real minimumVerticalMargin: 40
    readonly property real mediumVerticalMargin: 60

    readonly property real minimumSpacing: 11
    readonly property real mediumSpacing: 24
    readonly property real maximumSpacing: 32

    readonly property real formBorderBaseWidth: 1
    readonly property real formBorderActiveWidth: 2

    readonly property real formImplicitWidth: 200
    readonly property real formImplicitHeight: 48
}
