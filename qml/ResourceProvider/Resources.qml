pragma Singleton
import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    property alias icons: _icons
    QtObject {
        id: _icons
        readonly property string loadingLight: "qrc:/resources/icons/loading_light.svg"
        readonly property string loadingDark: "qrc:/resources/icons/loading_dark.svg"

        readonly property string checkboxCheck: "qrc:/resources/icons/md/checkbox check.svg"
        readonly property string checkboxEmpty: "qrc:/resources/icons/md/checkbox empty.svg"
        readonly property string chevroneDown: "qrc:/resources/icons/md/chevrone down.svg"
        readonly property string circleFilled: "qrc:/resources/icons/md/circle filled.svg"
        readonly property string circle: "qrc:/resources/icons/md/circle.svg"
        readonly property string flightdata: "qrc:/resources/icons/md/flightdata.svg"
        readonly property string fpl: "qrc:/resources/icons/md/fpl.svg"
        readonly property string grid: "qrc:/resources/icons/md/grid.svg"
        readonly property string help: "qrc:/resources/icons/md/help.svg"
        readonly property string layers: "qrc:/resources/icons/md/layers.svg"
        readonly property string line: "qrc:/resources/icons/md/line.svg"
        readonly property string pointer: "qrc:/resources/icons/md/pointer.svg"
        readonly property string polygon: "qrc:/resources/icons/md/polygon.svg"
        readonly property string rbl: "qrc:/resources/icons/md/rbl.svg"
        readonly property string runway: "qrc:/resources/icons/md/runway.svg"
        readonly property string search: "qrc:/resources/icons/md/search.svg"
        readonly property string settings: "qrc:/resources/icons/md/settings.svg"
        readonly property string text: "qrc:/resources/icons/md/text.svg"
        readonly property string weather: "qrc:/resources/icons/md/weather.svg"
        readonly property string user: "qrc:/resources/icons/md/user.svg"

        readonly property string arrowDown: "qrc:/resources/icons/sm/arrow down.svg"
        readonly property string arrowLeft: "qrc:/resources/icons/sm/arrow left.svg"
        readonly property string arrowRight: "qrc:/resources/icons/sm/arrow right.svg"
        readonly property string arrowUp: "qrc:/resources/icons/sm/arrow up.svg"
        readonly property string cross: "qrc:/resources/icons/sm/cross.svg"
        readonly property string plus: "qrc:/resources/icons/sm/plus.svg"

        readonly property string slRed: "qrc:/resources/icons/streetlights/red.svg"
        readonly property string slYellow: "qrc:/resources/icons/streetlights/yellow.svg"
        readonly property string slGreen: "qrc:/resources/icons/streetlights/green.svg"

        readonly property string sysGreen: "qrc:/resources/icons/system_green.svg"
        readonly property string sysRed: "qrc:/resources/icons/system_red.svg"

        readonly property string screenshot: "qrc:/resources/content/screenshot.png"
    }

    property alias fonts: _fonts
    QtObject {
        id: _fonts
        readonly property FontLoader fontLatoBoldLoader: FontLoader {
            source: "qrc:/resources/fonts/Lato-Bold.ttf"
        }
        readonly property FontLoader fontLatoRegularLoader: FontLoader {
            source: "qrc:/resources/fonts/Lato-Regular.ttf"
        }
    }
}
