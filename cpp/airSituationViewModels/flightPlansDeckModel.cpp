#include "flightPlansDeckModel.h"

FlightPlansDeckModel::FlightPlansDeckModel(QObject *parent) : QObject(parent)
{
    FlightPlansListModel* arrival = new FlightPlansListModel();
    FlightPlansListModel* departure = new FlightPlansListModel();
    m_fplists.append(arrival);
    m_fplists.append(departure);
}

void FlightPlansDeckModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<FlightPlansDeckModel>(moduleName.c_str(), 1, 0, "FlightPlansDeckModel");
}

QQmlListProperty<FlightPlansListModel> FlightPlansDeckModel::fplists()
{
    return {this, this,
             &FlightPlansDeckModel::fplistCount,
             &FlightPlansDeckModel::fplist};
}

//void FlightPlansDeckModel::appendFplist(FlightPlansListModel* p)
//{
//    m_fplists.append(p);
//}
int FlightPlansDeckModel::fplistCount() const
{
    return m_fplists.count();
}

FlightPlansListModel *FlightPlansDeckModel::fplist(int index) const
{
    return m_fplists.at(index);
}

int FlightPlansDeckModel::fplistCount(QQmlListProperty<FlightPlansListModel>* p)
{
    Q_UNUSED(p)
    return reinterpret_cast< FlightPlansDeckModel* >(p->data)->fplistCount();
}

FlightPlansListModel* FlightPlansDeckModel::fplist(QQmlListProperty<FlightPlansListModel>* p, int index)
{
    Q_UNUSED(p)
    return reinterpret_cast< FlightPlansDeckModel* >(p->data)->fplist(index);
}

int ds()
{

}
