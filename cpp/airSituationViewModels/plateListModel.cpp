#include "plateListModel.h"

PlateListModel::PlateListModel(QObject *parent) : QAbstractListModel(parent)
{
    m_flightPlansData.push_back(QStringList{"FFT2323", "B738", "M", "0000", "arrival"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832", "M", "0000", "arrival"});
    m_flightPlansData.push_back(QStringList{"LSB233", "A832", "M", "0000", "departure"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832", "M", "0000", "arrival"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832", "M", "0000", "taxi"});
}

void PlateListModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<PlateListModel>(moduleName.c_str(), 1, 0, "FlightPlansListModel");
}

int PlateListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_flightPlansData.size();
}

QVariant PlateListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case FlightRole:
        return m_flightPlansData.at(index.row()).at(0);
    case AircraftRole:
        return m_flightPlansData.at(index.row()).at(1);
    case LetterRole:
        return m_flightPlansData.at(index.row()).at(2);
    case NumberRole:
        return m_flightPlansData.at(index.row()).at(3);
    case FilterRole:
        return m_flightPlansData.at(index.row()).at(4);
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> PlateListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[FlightRole] = "flight";
    roles[AircraftRole] = "aircraft";
    roles[LetterRole] = "letter";
    roles[NumberRole] = "number";
    roles[FilterRole] = "filter";

    return roles;
}

