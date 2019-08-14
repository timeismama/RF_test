#-*- coding: utf-8 -*-

*** Settings ***
Resource     ../Platform_Common.robot

*** Variables ***

*** Keywords ***
Get bottom button
    [Arguments]     ${button_title}
    [Return]    //td[@id="meterPager_left"]/table/tbody/tr/td[@title="${button_title}"]

Click bottom button add
    ${add_button_ele}     Get bottom button   Ìí¼Ó
    click element when is enabled   ${add_button_ele}

Add