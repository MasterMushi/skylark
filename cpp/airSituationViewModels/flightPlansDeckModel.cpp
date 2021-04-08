#include "flightPlansDeckModel.h"

FlightPlansDeckModel::FlightPlansDeckModel(QObject *parent) : QAbstractListModel(parent)
{

}

int FlightPlansDeckModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_flightPlansLists.size();
}

QVariant FlightPlansDeckModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case Color:
        return m_flightPlansLists.at(index.row()).pinnedColor();
    case Title:
        return m_flightPlansLists.at(index.row()).title();
    case Position:
        return m_flightPlansLists.at(index.row()).position();
    case X:
        return m_flightPlansLists.at(index.row()).x();
    case Y:
        return m_flightPlansLists.at(index.row()).y();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> FlightPlansDeckModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Color] = "listColor";
    roles[Title] = "listTitle";
    roles[Position] = "position";

    return roles;
}
