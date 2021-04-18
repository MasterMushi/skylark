#pragma once

#include <QObject>
#include <vector>
#include "flightPlansListModel.h"
#include "filterFlightPlansListModel.h"

class AirSituationViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(FlightPlansListModel* fplmodel READ fplmodel)
    Q_PROPERTY(FilterFlightPlansListModel* arrivalModel READ arrivalModel)
    Q_PROPERTY(FilterFlightPlansListModel* flightPlansModel READ flightPlansModel)
    Q_PROPERTY(FilterFlightPlansListModel* runwaysModel READ runwaysModel)
    Q_PROPERTY(FilterFlightPlansListModel* weatherModel READ weatherModel)
    Q_PROPERTY(FilterFlightPlansListModel* departureModel READ departureModel)
    Q_PROPERTY(FilterFlightPlansListModel* pushBackModel READ pushBackModel)
    Q_PROPERTY(FilterFlightPlansListModel* taxiModel READ taxiModel)
    Q_PROPERTY(FilterFlightPlansListModel* otherModel READ otherModel)

public:

    explicit AirSituationViewModel(QObject *parent = nullptr);

    FlightPlansListModel *fplmodel();

    Q_INVOKABLE int changeFilter(const QString &flight, const QString &newFilterString);

    FilterFlightPlansListModel* arrivalModel();
    FilterFlightPlansListModel* flightPlansModel();
    FilterFlightPlansListModel* runwaysModel();
    FilterFlightPlansListModel* weatherModel();
    FilterFlightPlansListModel* departureModel();
    FilterFlightPlansListModel* pushBackModel();
    FilterFlightPlansListModel* taxiModel();
    FilterFlightPlansListModel* otherModel();

private:
    FlightPlansListModel* m_fplmodel;
    std::vector<FilterFlightPlansListModel*> m_listModels;
    FilterFlightPlansListModel* m_arrivalModel;
    FilterFlightPlansListModel* m_flightPlansModel;
    FilterFlightPlansListModel* m_runwaysModel;
    FilterFlightPlansListModel* m_weatherModel;
    FilterFlightPlansListModel* m_departureModel;
    FilterFlightPlansListModel* m_pushBackModel;
    FilterFlightPlansListModel* m_taxiModel;
    FilterFlightPlansListModel* m_otherModel;
};
