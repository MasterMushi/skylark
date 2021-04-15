#pragma once

#include <QObject>
#include <vector>
#include "flightPlansListModel.h"
#include "filterFlightPlansListModel.h"

class AirSituationViewModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FilterFlightPlansListModel* arrivalModel READ arrivalModel)
    Q_PROPERTY(FilterFlightPlansListModel* flightPlanModel READ flightPlanModel)
    Q_PROPERTY(FilterFlightPlansListModel* runwaysModel READ runwaysModel)
    Q_PROPERTY(FilterFlightPlansListModel* weatherModel READ weatherModel)
    Q_PROPERTY(FilterFlightPlansListModel* departureModel READ departureModel)
    Q_PROPERTY(FilterFlightPlansListModel* pushBackModel READ pushBackModel)
    Q_PROPERTY(FilterFlightPlansListModel* taxiModel READ taxiModel)
    Q_PROPERTY(FilterFlightPlansListModel* otherModel READ otherModel)

public:
    explicit AirSituationViewModel(QObject *parent = nullptr);

    FilterFlightPlansListModel* arrivalModel();
    FilterFlightPlansListModel* flightPlanModel();
    FilterFlightPlansListModel* runwaysModel();
    FilterFlightPlansListModel* weatherModel();
    FilterFlightPlansListModel* departureModel();
    FilterFlightPlansListModel* pushBackModel();
    FilterFlightPlansListModel* taxiModel();
    FilterFlightPlansListModel* otherModel();

private:
    FlightPlansListModel* fplmodel;
    std::vector<FilterFlightPlansListModel*> m_listModels;
    FilterFlightPlansListModel* m_arrivalModel;
    FilterFlightPlansListModel* m_flightPlanModel;
    FilterFlightPlansListModel* m_runwaysModel;
    FilterFlightPlansListModel* m_weatherModel;
    FilterFlightPlansListModel* m_departureModel;
    FilterFlightPlansListModel* m_pushBackModel;
    FilterFlightPlansListModel* m_taxiModel;
    FilterFlightPlansListModel* m_otherModel;
};
