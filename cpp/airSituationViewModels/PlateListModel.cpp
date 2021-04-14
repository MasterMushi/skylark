#include "plateListModel.h"

PlateListModel::PlateListModel(QObject *parent) : QAbstractListModel(parent)
{
    m_flightPlansData.push_back(QStringList{"FFT2323", "B738 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
}

void PlateListModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<PlateListModel>(moduleName.c_str(), 1, 0, "FlightPlansListModel");
}

int PlateListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_flightPlansData.size();
}

QVariant PlateListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case Text1Role:
        return m_flightPlansData.at(index.row()).at(0);
    case Text2Role:
        return m_flightPlansData.at(index.row()).at(1);
    case Text3Role:
        return m_flightPlansData.at(index.row()).at(2);
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> PlateListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Text1Role] = "text1";
    roles[Text2Role] = "text2";
    roles[Text3Role] = "text3";

    return roles;
}

QColor PlateListModel::pinnedColor() const
{
    return m_pinnedColor;
}

QColor PlateListModel::unpinnedColor() const
{
    return m_unpinnedColor;
}

QString PlateListModel::title() const
{
    return m_title;
}

int PlateListModel::position() const
{
    return m_position;
}

void PlateListModel::setPosition(int position)
{
    if (m_position != position)
    {
        m_position = position;
        emit positionChanged();
    }
}

int PlateListModel::x() const
{
    return m_x;
}

void PlateListModel::setX(int x)
{
    if (m_x != x)
    {
        m_x = x;
        emit xChanged();
    }
}

int PlateListModel::y() const
{
    return m_y;
}

void PlateListModel::setY(int y)
{
    if (m_y != y)
    {
        m_y = y;
        emit yChanged();
    }
}

int PlateListModel::width() const
{
    return m_width;
}

void PlateListModel::setWidth(int width)
{
    if (m_width != width)
    {
        m_width = width;
        emit widthChanged();
    }
}

int PlateListModel::height() const
{
    return m_height;
}

void PlateListModel::setHeight(int height)
{
    if (m_height!= height)
    {
        m_height = height;
        emit heightChanged();
    }
}
