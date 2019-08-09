*** Settings ***
Library   SeleniumLibrary    run_on_failure=Nothing

*** Variables ***

*** Keywords ***
Click element when is enabled
    [Arguments]  ${locator}
    wait until keyword succeeds     12      100ms   Wait until element is enabled   ${locator}
    wait until keyword succeeds     12      100ms   Wait until element is visible   ${locator}
    wait until keyword succeeds     20      300ms   click element   ${locator}


