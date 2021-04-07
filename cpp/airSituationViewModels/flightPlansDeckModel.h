#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <QQmlEngine>
#include <vector>
#include "flightPlansListModel.h"

class FlightPlansDeckModel : public QObject
{
    Q_OBJECT
public:
    explicit FlightPlansDeckModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

private:
    std::vector<FlightPlansListModel> m_data;
};
