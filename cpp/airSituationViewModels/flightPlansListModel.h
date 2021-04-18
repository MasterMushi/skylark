#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>
#include <QColor>
#include <vector>
#include "flightPlan.h"

class FlightPlansListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit FlightPlansListModel(QObject *parent = nullptr);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE int changeFilter(const QString &flight, const FlightPlan::Filter newFilter);

    enum Roles {
        FilterRole = Qt::UserRole + 1,
        FlightRole,
        AircraftRole,
        LetterRole,
        NumberRole
    };

private:
    std::vector<FlightPlan> m_flightPlansData;

};
