#pragma once

#include <QObject>
#include <QAbstractListModel>
#include "flightPlansListModel.h"

class FlightPlansDeckModel : public QAbstractListModel
{
    Q_OBJECT
//    Q_PROPERTY(
public:
    explicit FlightPlansDeckModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

//signals:

private:
    enum Roles {
        Color = Qt::UserRole + 1,
        Title,
        Position,
        X,
        Y,
        Data
    };

    std::vector<FlightPlansListModel> m_flightPlansLists;

};
