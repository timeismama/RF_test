*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup
Suite Teardown
Test Setup
Test Teardown

*** Variables ***

*** Test Cases ***
tin-xx : Add meter
    Given User in meter management page
    When click ungroup tree
    Then add meter

*** Keywords ***
User in meter management page
#    Platform_TopMenu.Get into meter page

click ungroup tree
    Platform_Common.Select unGroup left tree button

add meter
    Platform_MeterPage.Click bottom button add

