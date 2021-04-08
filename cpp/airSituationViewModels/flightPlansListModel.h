#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>
#include <QColor>
#include <QStringList>
#include <vector>

class FlightPlansListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color NOTIFY colorChanged)
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(int position READ position NOTIFY positionChanged)
    Q_PROPERTY(int x READ x NOTIFY xChanged)
    Q_PROPERTY(int y READ y NOTIFY yChanged)
    Q_PROPERTY(int width READ width NOTIFY widthChanged)
    Q_PROPERTY(int height READ height NOTIFY heightChanged)

public:
    explicit FlightPlansListModel(QObject *parent = nullptr);

    static void registerMe(const std::string& moduleName);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    QColor color() const;
    void setColor(QColor color);

    QString title() const;

    int position() const;
    void setPosition(int position);

    int x() const;
    void setX(int x);

    int y() const;
    void setY(int y);

    int width() const;
    void setWidth(int width);

    int height() const;
    void setHeight(int height);

signals:
    void colorChanged();
    void positionChanged();
    void xChanged();
    void yChanged();
    void widthChanged();
    void heightChanged();

private:
    enum Roles {
        Text1Role = Qt::UserRole + 1,
        Text2Role,
        Text3Role
    };

    enum Positon {
        Hide = 50,
        Unpin
    };

    QColor m_color = QColor("purple");
    QString m_title = "Title";
    int m_position = Hide;
    int m_x = 0;
    int m_y = 0;
    int m_width = 0;
    int m_height = 0;
    std::vector<QStringList> m_flightPlansData;

};
