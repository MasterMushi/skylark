#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>
#include <QColor>
#include <QStringList>
#include <vector>

class PlateListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit PlateListModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

signals:


private:
    enum Roles {
        FilterRole = Qt::UserRole + 1,
        FlightRole,
        AircraftRole,
        LetterRole,
        NumberRole
    };

    std::vector<QStringList> m_flightPlansData;

};
