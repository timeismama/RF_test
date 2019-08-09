*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
#Suite Teardown  close browser

*** Variables ***

*** Test Cases ***
IP-xxx : Add organization
    Given User is in organization info page
    Then add organization


*** Keywords ***
User is in organization info page
    sleep  20s
    Get into organization page

add organization
    wait for loading page
    Platform_OrganizationPage.Click bottom button add