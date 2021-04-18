#pragma once

#include <QString>

class FlightPlan
{

public:
    enum Filter {
        Arrival,
        FlightPlans,
        Runways,
        Weather,
        Departure,
        PushBack,
        Taxi,
        Other
    };

    FlightPlan() = default;
    FlightPlan(const QString &flight, const QString &aircraft, const QString &letter, const QString &number, const Filter filter);

    bool operator==(const FlightPlan &fp);

    QString flight() const;
    QString aircraft() const;
    QString letter() const;
    QString number() const;
    Filter filter() const;

    void setFilter(const Filter f);

private:
    QString m_flight;
    QString m_aircraft;
    QString m_letter;
    QString m_number;
    Filter m_filter;
};

