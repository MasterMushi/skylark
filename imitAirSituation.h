#pragma once

#include <QObject>
#include <QString>
#include <QList>

class ImitAirSituation : public QObject
{
    Q_OBJECT
public:
    explicit ImitAirSituation(QObject *parent = nullptr);

    Q_PROPERTY(QList airSituationList READ airSituationList NOTIFY airSituationListChanged)

    struct AirSituationListItem {
        QString text1;
        QString text2;
        QString text3;
    };

    QList<AirSituationListItem>* airSituationList;
};
