#pragma once

#include <QObject>
#include <QSortFilterProxyModel>
#include "flightPlan.h"
#include "flightPlansListModel.h"

class FilterFlightPlansListModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    FilterFlightPlansListModel() = default;
    FilterFlightPlansListModel(QAbstractListModel* model, FlightPlan::Filter f);

    virtual bool filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const;

    FlightPlan::Filter filter();

private:
    FlightPlan::Filter m_filter;
};
