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

    enum Roles {
        Color = Qt::UserRole + 1,
        Title,
        List
    };

    std::vector<FlightPlansListModel> m_data;
};
