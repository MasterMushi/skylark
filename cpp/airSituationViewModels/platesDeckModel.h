#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <vector>
#include "plateListModel.h"

class PlatesDeckModel : public QAbstractListModel
{
    Q_OBJECT
//    Q_PROPERTY(std::vector<PlateListModel> plates READ plates NOTIFY platesChanged)

public:
    explicit PlatesDeckModel(QObject *parent = nullptr);


private:
    std::vector<PlateListModel> m_plates;

};
