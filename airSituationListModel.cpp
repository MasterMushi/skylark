#include "airSituationListModel.h"
#include <QQmlEngine>

AirSituationListModel::AirSituationListModel(QObject *parent) : QAbstractListModel(parent)
{
    m_data.push_back(QStringList{"text1", "text2", "text3"});
    m_data.push_back(QStringList{"text4", "text5", "text6"});
}

void AirSituationListModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<AirSituationListModel>(moduleName.c_str(), 1, 0, "AirSituationListModel");
}

int AirSituationListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant AirSituationListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case Text1Role:
        return m_data.at(index.row()).at(0);
    case Text2Role:
        return m_data.at(index.row()).at(1);
    case Text3Role:
        return m_data.at(index.row()).at(2);
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> AirSituationListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Text1Role] = "text1";
    roles[Text2Role] = "text2";
    roles[Text3Role] = "text3";

    return roles;
}

//void AirSituationListModel::add()
//{
//    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
//    m_data.push_back(QStringList{"text1", "text2", "text3"});
//    endInsertRows();

//}
