#include "airSituationToolBar.h"

AirSituationToolBar::AirSituationToolBar(QObject *parent) : QObject(parent)
{

}

void AirSituationToolBar::flightdataClicked()
{
    flightdataClickedSignal();
}
