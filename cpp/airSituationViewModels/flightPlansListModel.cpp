#include "flightPlansListModel.h"

FlightPlansListModel::FlightPlansListModel(QObject *parent) : QAbstractListModel(parent)
{
    m_flightPlansData.push_back(FlightPlan("FFT2323", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("DAL2359", "A832", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "B738", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "A832", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("DAL2359", "B738", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "B738", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("DAL2359", "A832", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "A832", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("DAL2359", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2323", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4543", "B738", "M", "0000", FlightPlan::Runways));



}

int FlightPlansListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_flightPlansData.size();
}

QVariant FlightPlansListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case FlightRole:
        return m_flightPlansData.at(index.row()).flight();
    case AircraftRole:
        return m_flightPlansData.at(index.row()).aircraft();
    case LetterRole:
        return m_flightPlansData.at(index.row()).letter();
    case NumberRole:
        return m_flightPlansData.at(index.row()).number();
    case FilterRole:
        return m_flightPlansData.at(index.row()).filter();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> FlightPlansListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[FlightRole] = "flight";
    roles[AircraftRole] = "aircraft";
    roles[LetterRole] = "letter";
    roles[NumberRole] = "number";
    roles[FilterRole] = "filter";

    return roles;
}

