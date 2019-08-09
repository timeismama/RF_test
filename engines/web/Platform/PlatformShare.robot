*** Settings ***
Library   SeleniumLibrary    run_on_failure=Nothing
Library           Process
Library           OperatingSystem
Library           Dialogs
Library           AsyncLibrary
Library           FakerLibrary    locale=de_DE
Library           Collections
Library           String

Resource        ../WebShare.robot
Resource        Resources/PO/Platform_TopMenu.robot
Resource        Resources/Platform_Common.robot
Resource        Resources/PO/Platform_LoginPage.robot
Resource        Resources/PO/Platform_OrganizationPage.robot


*** Keywords ***
Start Platform with default user account
    [Documentation]    Open and maximize browser with selected url
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${chrome noProxy}=    Evaluate    selenium.webdriver.Proxy({'proxyType':selenium.webdriver.common.proxy.ProxyType.DIRECT})    modules=sys, selenium
    Call Method    ${chrome options}    add_argument    --lang\=en-US
    Call Method    ${chrome options}    add_argument    --disable-single-click-autofill
    ${chrome options}    Call Method    ${chrome options}    to_capabilities
    Call Method    ${chrome noProxy}    add_to_capabilities    ${chrome options}
    Create Webdriver    Chrome    desired_capabilities=${chrome options}
    Go to    ${WEB_PLATFORM_URL}
    sleep  20s
    Log in


Log in
    [Arguments]     ${user}=${WEB_PLATFORM_USER_NAME}     ${password}=${WEB_PLATFORM_USER_PASSWORD}
    [Documentation]  login platform by ginven a default account
    Platform_LoginPage.Insert Username      ${user}
    Platform_LoginPage.Insert Password      ${password}
    Platform_LoginPage.Click login button
