#include "flightPlansListModel.h"

FlightPlansListModel::FlightPlansListModel(QColor color, QString title, QObject *parent) : QAbstractListModel(parent)
{
    m_color = color;
    m_title = title;

    m_flightPlansData.push_back(QStringList{"FFT2323", "B738 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
    m_flightPlansData.push_back(QStringList{"RPA4543", "A832 - M", "0000"});
}

void FlightPlansListModel::registerMe(const std::string &moduleName)
{
    qmlRegisterType<FlightPlansListModel>(moduleName.c_str(), 1, 0, "FlightPlansListModel");
}

int FlightPlansListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_flightPlansData.size();
}

QVariant FlightPlansListModel::data(const QModelIndex &index, int role) const
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

QHash<int, QByteArray> FlightPlansListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Text1Role] = "text1";
    roles[Text2Role] = "text2";
    roles[Text3Role] = "text3";

    return roles;
}

QColor FlightPlansListModel::color() const
{
    return m_color;
}

void FlightPlansListModel::setColor(QColor color)
{
    if (m_color != color)
    {
        m_color = color;
        emit colorChanged();
    }
}

QString FlightPlansListModel::title() const
{
    return m_title;
}

int FlightPlansListModel::x() const
{
    return m_x;
}

void FlightPlansListModel::setX(int x)
{
    if (m_x != x)
    {
        m_x = x;
        emit xChanged();
    }
}

int FlightPlansListModel::y() const
{
    return m_y;
}

void FlightPlansListModel::setY(int y)
{
    if (m_y != y)
    {
        m_y = y;
        emit yChanged();
    }
}

int FlightPlansListModel::width() const
{
    return m_width;
}

void FlightPlansListModel::setWidth(int width)
{
    if (m_width != width)
    {
        m_width = width;
        emit widthChanged();
    }
}

int FlightPlansListModel::height() const
{
    return m_height;
}

void FlightPlansListModel::setHeight(int height)
{
    if (m_height!= height)
    {
        m_height = height;
        emit heightChanged();
    }
}
