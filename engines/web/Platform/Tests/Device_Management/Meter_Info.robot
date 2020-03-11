#-*- coding: utf-8 -*-
#coding: utf-8

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
@{list}   006  123321  1  0  5  23  WS  12123123test  11.2313  3.2341  009  344323  0  0  5  24543  1w3  test  12.2313  5.2341
${index}   30
${ROW_ID}  jqg_meterGrid_0

*** Test Cases ***
tin-01 : Add meter
    Given User in meter management page
    When click ungroup tree
    Then add meter

tin-02 edit meter
    Then edit meterNumber

tin-03 delted meter
    Then delete meter

tin-04 deltedAll meter
    Then deltedAll meter

tin-05 replace meter
    Then replace meter

tin-06 correlation concentrator
    Then correlation concentrator

tin-07 cancel the association concentrator
    Then cancel the association concentrator

*** Keywords ***
User in meter management page
    Platform_TopMenu.Get into meter page

click ungroup tree
    wait for loading page
    Platform_Common.Select unGroup left tree button  Î´·Ö×é
    sleep  2s

add meter
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  @{list}[0]
    Platform_Device.Set meter_orgTree  meterEditOrgTree_2_a
    Platform_Device.Set meter_infor  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]  @{list}[7]  @{list}[8]  @{list}[9]
    sleep  2s

edit meterNumber
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button edit
    Click meter_meterNumberEdit  @{list}[10]
    sleep  2s
    Platform_Device.Set meter_orgTree  meterEditOrgTree_1_a
    Platform_Device.Set meter_infor  @{list}[11]  @{list}[12]  @{list}[13]  @{list}[14]  @{list}[15]  @{list}[16]  @{list}[17]  @{list}[18]  @{list}[19]

delete meter
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button deleted
    Platform_Common.Set deletde reason  0
    Platform_Common.Click delete confirm button

deltedAll meter
    Platform_Device.Click bottom button deletedAll
    Platform_Common.Set deletde reason  1
    Platform_Common.Click delete confirm button

replace meter
    Platform_Common.Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button replaceMeter
    Platform_Common.Select list one row   jqg_endMeasGrid_1
    Platform_Common.Click meterReplace_next
    Platform_Common.Select list one row   jqg_newmeterGrid_0
    Platform_Common.Click meterReplace_next
    Platform_Common.Select list one row   jqg_startMeasGrid_0
    Platform_Common.Click meterReplace_next
    Platform_Common.Click meterReplace_over
    Platform_Common.Click warm delDialog_confirm

correlation concentrator
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button correlationConcentrator
    Select list one row  jqg_connectConcentratorGrid_1
    Platform_Device.Click meter button connect_concentrator

cancel the association concentrator
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button cancelTheAssociationConcentrator
    Platform_Common.Click warm comfirem