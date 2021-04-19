#pragma once

#include <QObject>

class AirSituationToolBar : public QObject
{
    Q_OBJECT
public:
    explicit AirSituationToolBar(QObject *parent = nullptr);

    Q_INVOKABLE void flightdataClicked();

signals:
    void flightdataClickedSignal();
};

