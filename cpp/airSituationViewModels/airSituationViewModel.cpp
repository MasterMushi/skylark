#include "airSituationViewModel.h"

AirSituationViewModel::AirSituationViewModel(QObject *parent) : QObject(parent)
{
    fplmodel = new FlightPlansListModel();
    m_arrivalModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Arrival);
    m_flightPlanModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::FlightPlans);
    m_runwaysModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Runways);
    m_weatherModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Weather);
    m_departureModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Departure);
    m_pushBackModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::PushBack);
    m_taxiModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Taxi);
    m_otherModel = new FilterFlightPlansListModel(fplmodel, FlightPlan::Other);

    m_listModels.push_back(m_arrivalModel);
    m_listModels.push_back(m_flightPlanModel);
    m_listModels.push_back(m_runwaysModel);
    m_listModels.push_back(m_weatherModel);
    m_listModels.push_back(m_departureModel);
    m_listModels.push_back(m_pushBackModel);
    m_listModels.push_back(m_taxiModel);
    m_listModels.push_back(m_otherModel);
}

FilterFlightPlansListModel *AirSituationViewModel::arrivalModel()
{
    return m_arrivalModel;
}

FilterFlightPlansListModel *AirSituationViewModel::flightPlanModel()
{
    return m_flightPlanModel;
}

FilterFlightPlansListModel *AirSituationViewModel::runwaysModel()
{
    return m_runwaysModel;
}

FilterFlightPlansListModel *AirSituationViewModel::weatherModel()
{
    return m_weatherModel;
}

FilterFlightPlansListModel *AirSituationViewModel::departureModel()
{
    return m_departureModel;
}

FilterFlightPlansListModel *AirSituationViewModel::pushBackModel()
{
    return m_pushBackModel;
}

FilterFlightPlansListModel *AirSituationViewModel::taxiModel()
{
    return m_taxiModel;
}

FilterFlightPlansListModel *AirSituationViewModel::otherModel()
{
    return m_otherModel;
}

