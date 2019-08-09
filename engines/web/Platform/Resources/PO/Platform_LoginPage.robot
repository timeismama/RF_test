*** Settings ***
Resource  ../Platform_Common.robot

*** Variables ***
${WEB_PLATFORM_LP_USER_INPUTBOX}    id:account
${WEB_PLATFORM_LP_PASSWORD_INPUTBOX}    id:password
${WEB_PLATFORM_LP_LOG_IN_BUTTON}     id:login

*** Keywords ***
Insert Username
    [Arguments]  ${value}
    Input text      ${WEB_PLATFORM_LP_USER_INPUTBOX}    ${value}

Insert Password
    [Arguments]  ${value}
    Input Password   ${WEB_PLATFORM_LP_PASSWORD_INPUTBOX}    ${value}

Click login button
    Click element when is enabled   ${WEB_PLATFORM_LP_LOG_IN_BUTTON}
    wait for loading page
    wait until keyword succeeds     10      1s      Page Should Not Contain Element     ${WEB_PLATFORM_LP_LOG_IN_BUTTON}