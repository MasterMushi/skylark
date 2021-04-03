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
        qDebug() << "Login is OK";
        setIsBusy(true);
        setLoginError(false);
        timer->start(3000);
        setLoginOk(true);
        return;
    }
    qDebug() << "Login isn't OK";
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
        qDebug() << "setIsBusy <<" << isBusy;
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
        qDebug() << "setLoginError <<" << loginError;
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
        qDebug() << "setLoginOk <<" << loginOk;
    }
}

void Imit::timerSlot()
{
    setIsBusy(false);
}



