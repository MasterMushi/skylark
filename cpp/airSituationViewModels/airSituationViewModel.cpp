#include "airSituationViewModel.h"

AirSituationViewModel::AirSituationViewModel(QObject *parent) : QObject(parent)
{
    m_fplmodel = new FlightPlansListModel();
    m_arrivalModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Arrival);
    m_flightPlansModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::FlightPlans);
    m_runwaysModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Runways);
    m_weatherModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Weather);
    m_departureModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Departure);
    m_pushBackModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::PushBack);
    m_taxiModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Taxi);
    m_otherModel = new FilterFlightPlansListModel(m_fplmodel, FlightPlan::Other);

    m_listModels.push_back(m_arrivalModel);
    m_listModels.push_back(m_flightPlansModel);
    m_listModels.push_back(m_runwaysModel);
    m_listModels.push_back(m_weatherModel);
    m_listModels.push_back(m_departureModel);
    m_listModels.push_back(m_pushBackModel);
    m_listModels.push_back(m_taxiModel);
    m_listModels.push_back(m_otherModel);
}

FlightPlansListModel *AirSituationViewModel::fplmodel()
{
    return m_fplmodel;
}

int AirSituationViewModel::changeFilter(const QString &flight, const QString &newFilterString)
{
    FlightPlan::Filter newFilter;
    qDebug() << flight << newFilterString;
    if (newFilterString == "Arrival") newFilter = FlightPlan::Filter::Arrival;
    else if (newFilterString == "Flight Plans") newFilter = FlightPlan::Filter::FlightPlans;
    else if (newFilterString == "Runways") newFilter = FlightPlan::Filter::Runways;
    else if (newFilterString == "Weather") newFilter = FlightPlan::Filter::Weather;
    else if (newFilterString == "Departure") newFilter = FlightPlan::Filter::Departure;
    else if (newFilterString == "Push Back") newFilter = FlightPlan::Filter::PushBack;
    else if (newFilterString == "Taxi") newFilter = FlightPlan::Filter::Taxi;
    else if (newFilterString == "Other") newFilter = FlightPlan::Filter::Other;
    else return -1;

    return m_fplmodel->changeFilter(flight, newFilter);
}

FilterFlightPlansListModel *AirSituationViewModel::arrivalModel()
{
    return m_arrivalModel;
}

FilterFlightPlansListModel *AirSituationViewModel::flightPlansModel()
{
    return m_flightPlansModel;
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

