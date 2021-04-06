#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <QStringList>
#include <vector>

class AirSituationListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit AirSituationListModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

private:
    enum Roles {
        Text1Role = Qt::UserRole + 1,
        Text2Role,
        Text3Role
    };

    std::vector<QStringList> m_data;
};
