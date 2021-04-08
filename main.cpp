#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "cpp/loginViewModels/loginViewModel.h"
#include "cpp/airSituationViewModels/flightPlansListModel.h"
#include "cpp/airSituationViewModels/flightPlansDeckModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath(":/qml");

    // Here register all c++ models
    LoginViewModel::registerSingletonMe("LoginViewModel");
    //FlightPlansListModel::registerMe("FlightPlansListModel");
    FlightPlansDeckModel::registerMe("FlightPlansDeckModel");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
