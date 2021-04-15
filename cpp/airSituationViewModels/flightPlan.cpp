#include "flightPlan.h"

FlightPlan::FlightPlan(const QString &flight, const QString &aircraft, const QString &letter, const QString &number, const FlightPlan::Filter filter)
    : m_flight { std::move(flight) },
      m_aircraft { std::move(aircraft) },
      m_letter { std::move(letter) },
      m_number { std::move(number) },
      m_filter { std::move(filter) }
{
}

QString FlightPlan::flight() const
{
    return m_flight;
}

QString FlightPlan::aircraft() const
{
    return m_aircraft;
}

QString FlightPlan::letter() const
{
    return m_letter;
}

QString FlightPlan::number() const
{
    return m_number;
}

FlightPlan::Filter FlightPlan::filter() const
{
    return m_filter;
}

void FlightPlan::setFilter(FlightPlan::Filter f)
{
    m_filter = f;
}
