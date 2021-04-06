#include "loginViewModel.h"
#include "QDebug"

LoginViewModel::LoginViewModel(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),
          this, SLOT(timerSlot()));
}

void LoginViewModel::checkLogin(const QString &user, const QString &pass)
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

void LoginViewModel::registerSingletonMe(const std::string &moduleName)
{
    qmlRegisterSingletonType<LoginViewModel>(moduleName.c_str(), 1, 0, "LoginViewModel", singletonProvider);
}

bool LoginViewModel::isBusy() const
{
    return m_isBusy;
}

void LoginViewModel::setIsBusy(bool isBusy)
{
    if (m_isBusy != isBusy)
    {
        m_isBusy = isBusy;
        emit busyChanged();
    }
}

bool LoginViewModel::loginError() const
{
    return m_loginError;
}

void LoginViewModel::setLoginError(bool loginError)
{
    if (m_loginError != loginError)
    {
        m_loginError = loginError;
        emit loginErrorChanged();
    }
}

bool LoginViewModel::loginOk() const
{
    return m_loginOk;
}

void LoginViewModel::setLoginOk(bool loginOk)
{
    if (m_loginOk != loginOk)
    {
        m_loginOk = loginOk;

        emit loginOkChanged();
    }
}

QString LoginViewModel::user() const
{
    return m_user;
}

void LoginViewModel::setUser(const QString &user)
{
    if (m_user != user)
    {
        m_user = user;
        emit userChanged();
    }
}

QObject *LoginViewModel::singletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    LoginViewModel *loginViewModel = new LoginViewModel();
    return loginViewModel;
}

void LoginViewModel::timerSlot()
{
    setIsBusy(false);
}



