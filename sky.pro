QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        airSituationViewModel.cpp \
        cpp/AirSituation/airSituationViewModel.cpp \
        cpp/AirSituation/flightPlansListModel.cpp \
        cpp/Login/loginViewModel.cpp \
        cpp/airSituationViewModel.cpp \
        cpp/airSituationViewModels/airSituationViewModel.cpp \
        cpp/airSituationViewModels/flighPlansDeckModel.cpp \
        cpp/airSituationViewModels/flightPlansListModel.cpp \
        cpp/flightPlansListModel.cpp \
        cpp/loginViewModel.cpp \
        cpp/loginViewModels/loginViewModel.cpp \
        flightPlansListModel.cpp \
        loginViewModel.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$PWD/qml
QML2_IMPORT_PATH += $$PWD/qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    airSituationViewModel.h \
    cpp/AirSituation/airSituationViewModel.h \
    cpp/AirSituation/flightPlansListModel.h \
    cpp/Login/loginViewModel.h \
    cpp/airSituationViewModel.h \
    cpp/airSituationViewModels/airSituationViewModel.h \
    cpp/airSituationViewModels/flighPlansDeckModel.h \
    cpp/airSituationViewModels/flightPlansListModel.h \
    cpp/flightPlansListModel.h \
    cpp/loginViewModel.h \
    cpp/loginViewModels/loginViewModel.h \
    flightPlansListModel.h \
    loginViewModel.h

DISTFILES +=
