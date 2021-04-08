#pragma once

#include <QObject>
#include <vector>
#include "flightPlansListModel.h"

class AirSituationViewModel : public QObject
{
    Q_OBJECT
public:
    explicit AirSituationViewModel(QObject *parent = nullptr);

private:

    std::vector<FlightPlansListModel> m_data;
};
