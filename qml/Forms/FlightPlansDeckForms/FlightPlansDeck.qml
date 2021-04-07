import QtQuick 2.0

Item {
    property alias model: modelLoader.sourceComponent
    Loader { id: modelLoader }

}
