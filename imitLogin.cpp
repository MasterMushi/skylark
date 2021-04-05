#include "imitLogin.h"
#include "QDebug"

ImitLogin::ImitLogin(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),
          this, SLOT(timerSlot()));
}

void ImitLogin::checkLogin(const QString &user, const QString &pass)
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

bool ImitLogin::isBusy() const
{
    return m_isBusy;
}

void ImitLogin::setIsBusy(bool isBusy)
{
    if (m_isBusy != isBusy)
    {
        m_isBusy = isBusy;
        emit busyChanged();
    }
}

bool ImitLogin::loginError() const
{
    return m_loginError;
}

void ImitLogin::setLoginError(bool loginError)
{
    if (m_loginError != loginError)
    {
        m_loginError = loginError;
        emit loginErrorChanged();
    }
}

bool ImitLogin::loginOk() const
{
    return m_loginOk;
}

void ImitLogin::setLoginOk(bool loginOk)
{
    if (m_loginOk != loginOk)
    {
        m_loginOk = loginOk;

        emit loginOkChanged();
    }
}

QString ImitLogin::user() const
{
    return m_user;
}

void ImitLogin::setUser(const QString &user)
{
    if (m_user != user)
    {
        m_user = user;
        emit userChanged();
    }
}

void ImitLogin::timerSlot()
{
    setIsBusy(false);
}



