#pragma once

#include <QObject>
#include <QTimer>

class Imit : public QObject
{
    Q_OBJECT
public:
    explicit Imit(QObject *parent = nullptr);

    Q_INVOKABLE void checkLogin(const QString& user, const QString& pass);
    Q_PROPERTY(bool isBusy READ isBusy NOTIFY busyChanged)
    Q_PROPERTY(bool loginError READ loginError NOTIFY loginErrorChanged)
    Q_PROPERTY(bool loginOk READ loginOk NOTIFY loginOkChanged)

    bool isBusy() const;
    void setIsBusy(bool isBusy);

    bool loginError() const;
    void setLoginError(bool loginError);

    bool loginOk() const;
    void setLoginOk(bool loginOk);

signals:
    void busyChanged();
    void loginErrorChanged();
    void loginOkChanged();

private slots:
    void timerSlot();

private:
    bool m_isBusy = false;
    bool m_loginError = false;
    bool m_loginOk = false;

    QTimer *timer;
};

