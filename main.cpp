#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "cpp/loginViewModels/loginViewModel.h"
#include "cpp/airSituationViewModels/airSituationViewModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath(":/qml");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    // Here register all c++ models
    LoginViewModel *loginViewModel = new LoginViewModel();
    engine.rootContext()->setContextProperty("loginViewModel", loginViewModel);

    AirSituationViewModel *airSituationViewModel = new AirSituationViewModel();
    engine.rootContext()->setContextProperty("airSituationViewModel", airSituationViewModel);

    engine.load(url);

    return app.exec();
}
