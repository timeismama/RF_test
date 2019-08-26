*** Settings ***
Resource    ../Platform_Common.robot

*** Variables ***

*** Keywords ***
Click or use url
    [Arguments]  ${url_end}
    go to   ${WEB_PLATFORM_URL}/index.html#/${url_end}

Get into organization page
    Click or use url    organization
#
#Get into meter page
#    Click or use url  meter

Get into customer page
    Click or use url  customer