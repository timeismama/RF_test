*** Settings ***
Resource    ../PlatformShare.robot

*** Variables ***
${WEB_PLATFORM_URL}   http://demo.metering-cloud.com/platform25
${WEB_PLATFORM_USER_NAME}    admin
${WEB_PLATFORM_USER_PASSWORD}    radio123
${WEB_PLATFORM_SELENIUM_TIMEOUT}    3s
${WEB_PLATFORM_LOADING_PAGE_ICON}   //img[@id="organizationLoader"]

*** Keywords ***
wait for loading page
    [Documentation]    Wait for dissapearing all loading page icons
    Sleep    20ms    reason=wait for load loading indicator
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    ${WEB_PLATFORM_SELENIUM_TIMEOUT}    20 ms    Page Should Not Contain element    ${WEB_PLATFORM_LOADING_PAGE_ICON}    loglevel=NONE

Select unGroup left tree button
    click element when is enabled    //span[contains(text(),'未分组')]




