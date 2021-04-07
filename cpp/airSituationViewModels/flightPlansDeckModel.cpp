#include "flightPlansDeckModel.h"


FlightPlansDeckModel::FlightPlansDeckModel(QObject *parent) : QObject(parent)
{
    FlightPlansListModel arrival(QColor("red"), "Arrival");
    FlightPlansListModel departure(QColor("blue"), "Departure");
    m_data.push_back(arrival);
    m_data.push_back(departure);
}

void FlightPlansDeckModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<FlightPlansDeckModel>(moduleName.c_str(), 1, 0, "FlightPlansDeckModel");
}

int FlightPlansDeckModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant FlightPlansDeckModel::data(const QModelIndex &index, int role) const
{
//    if (!index.isValid()) {
//        return QVariant();
//    }

//    switch (role) {
//    case Text1Role:
//        return m_data.at(index.row()).at(0);
//    case Text2Role:
//        return m_data.at(index.row()).at(1);
//    case Text3Role:
//        return m_data.at(index.row()).at(2);
//    default:
//        return QVariant();
    //    }
}

QHash<int, QByteArray> FlightPlansDeckModel::roleNames() const
{

}


