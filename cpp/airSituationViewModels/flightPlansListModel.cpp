#include "flightPlansListModel.h"

FlightPlansListModel::FlightPlansListModel(QObject *parent) : QAbstractListModel(parent)
{
    m_flightPlansData.push_back(FlightPlan("FFT2321", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("RPA4542", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("DAL2353", "A832", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("FFT2324", "B738", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("RPA4545", "A832", "M", "0000", FlightPlan::Departure));
    m_flightPlansData.push_back(FlightPlan("DAL2356", "B738", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("FFT2327", "B738", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("DAL2358", "A832", "M", "0000", FlightPlan::Other));
    m_flightPlansData.push_back(FlightPlan("RPA4549", "B738", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("FFT2210", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("FFT2211", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("FFT4212", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("FFT3213", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("FFT1314", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("FFT2215", "B738", "M", "0000", FlightPlan::Taxi));
    m_flightPlansData.push_back(FlightPlan("RPA4416", "A832", "M", "0000", FlightPlan::Arrival));
    m_flightPlansData.push_back(FlightPlan("DAL2517", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("RPA4418", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("RPA4418", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("RPA4418", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("RPA4418", "B738", "M", "0000", FlightPlan::FlightPlans));
    m_flightPlansData.push_back(FlightPlan("FFT2219", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4420", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4421", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2222", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2223", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("FFT2224", "A832", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4425", "B738", "M", "0000", FlightPlan::Runways));
    m_flightPlansData.push_back(FlightPlan("RPA4426", "B738", "M", "0000", FlightPlan::Runways));

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

int FlightPlansListModel::changeFilter(const QString &flight, const FlightPlan::Filter newFilter)
{
    for (uint i = 0; i < m_flightPlansData.size(); i++)
    {
        auto fp = &m_flightPlansData.at(i);
        if (fp->flight() == flight)// && fp->filter() != newFilter)
        {
            fp->setFilter(newFilter);

            QModelIndex index = createIndex(i, 0, static_cast<void *>(0));
            emit dataChanged(index, index);
            qDebug() << "changed!";
            return 0;
        }
    }
    return 1;
}

