#include "imit.h"
#include "QDebug"

Imit::Imit(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),
          this, SLOT(timerSlot()));
}

void Imit::checkLogin(const QString &user, const QString &pass)
{
    if (user == "JTK" && pass == "11111")
    {
        setIsBusy(true);
        setLoginError(false);
        timer->start(3000);
        setLoginOk(true);
        setUser(user);
        return;
    }
    setIsBusy(false);
    setLoginError(true);
}

bool Imit::isBusy() const
{
    return m_isBusy;
}

void Imit::setIsBusy(bool isBusy)
{
    if (m_isBusy != isBusy)
    {
        m_isBusy = isBusy;
        emit busyChanged();
    }
}

bool Imit::loginError() const
{
    return m_loginError;
}

void Imit::setLoginError(bool loginError)
{
    if (m_loginError != loginError)
    {
        m_loginError = loginError;
        emit loginErrorChanged();
    }
}

bool Imit::loginOk() const
{
    return m_loginOk;
}

void Imit::setLoginOk(bool loginOk)
{
    if (m_loginOk != loginOk)
    {
        m_loginOk = loginOk;

        emit loginOkChanged();
    }
}

QString Imit::user() const
{
    return m_user;
}

void Imit::setUser(const QString &user)
{
    if (m_user != user)
    {
        m_user = user;
        emit userChanged();
    }
}

void Imit::timerSlot()
{
    setIsBusy(false);
}



