#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "imitLogin.h"

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

    ImitLogin *imitLogin = new ImitLogin();
    engine.rootContext()->setContextProperty("imitLogin", imitLogin);

    engine.load(url);

    return app.exec();
}
