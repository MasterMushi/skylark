#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <QQmlEngine>
#include <QQmlListProperty>
#include <QVector>
#include "flightPlansListModel.h"

class FlightPlansDeckModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<FlightPlansListModel> fplists READ fplists)
    QML_ELEMENT

public:
    FlightPlansDeckModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    QQmlListProperty<FlightPlansListModel> fplists();
    int fplistCount() const;
    FlightPlansListModel *fplist(int) const;

private:
    //static void appendFplist(QQmlListProperty<FlightPlansListModel>*, FlightPlansListModel*);
    int fplistCount(QQmlListProperty<FlightPlansListModel>*);
    FlightPlansListModel* fplist(QQmlListProperty<FlightPlansListModel>*, int);

    QVector<FlightPlansListModel *> m_fplists;
};
