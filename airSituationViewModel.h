#pragma once

#include <QObject>
#include <QString>
#include <QList>
#include "airSituationListModel.h"

class AirSituationViewModel : public QObject
{
    Q_OBJECT
public:
    explicit AirSituationViewModel(QObject *parent = nullptr);

private:
    QList<AirSituationListModel> m_airSituationListModels;
};
