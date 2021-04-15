#include "filterFlightPlansListModel.h"


FilterFlightPlansListModel::FilterFlightPlansListModel(QAbstractListModel *model, FlightPlan::Filter f)
{
    this->setSourceModel(model);
    this->setFilterRole(FlightPlansListModel::FilterRole);
    m_filter = f;
}

bool FilterFlightPlansListModel::filterAcceptsRow(int sourceRow, const QModelIndex& sourceParent) const
{
    QModelIndex i = sourceModel()->index(sourceRow, 0, sourceParent);
    return sourceModel()->data(i, filterRole()).toInt() == m_filter;
}

FlightPlan::Filter FilterFlightPlansListModel::filter()
{
    return m_filter;
}
