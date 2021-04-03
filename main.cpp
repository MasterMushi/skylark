#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "imit.h"

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

    Imit *imit = new Imit();
    engine.rootContext()->setContextProperty("imit", imit);

    engine.load(url);

    return app.exec();
}