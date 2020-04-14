#-*- coding: utf-8 -*-

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
@{list}   H001  123321  1  0  2  23  WS  12123123test  11.2313  3.2341  009  344323  0  0  5  24543  1w3  test  12.2313  5.2341
${index}   30
${ROW_ID}  jqg_meterGrid_0
${meter_noGroup}  未分组
${meter_waterNumber}  W001
${meter_gasNumber}  G001
${meter_number_empty}  *仪表编号不能为空
${meter_number_exist}  *仪表编号已存在

*** Test Cases ***
IP-6069: add meter number empty
    Given User in meter management page
    When Add meter number empty
    Then Add meter success  ${meter_number_empty}

IP-6070: add heat meter
    Given User in meter management page
    When Add heat meter
    Then Add meter success  @{list}[0]
    [Teardown]  Delete meter

IP-6071: add water meter
    Given User in meter management page
    When Add water meter
    Then Add meter success  ${meter_waterNumber}
    [Teardown]  Delete meter

IP-6072: add gas meter
    Given User in meter management page
    When Add gas meter
    Then Add meter success  ${meter_gasNumber}
    [Teardown]  Delete meter

IP-6073: add meter and concentrator
    Given User in meter management page
    When Add meter and concentrator
    Then Add meter success  M-Bus
    [Teardown]  Delete meter

IP-6074: add different organization meter
    Given User in meter management page
    When Add different organization meter
    Then Add meter success  @{list}[0]
    [Teardown]  Delete meter

IP-6174: add meter additinal field
    Given User in meter management page
    When Add meter additinal field
    Then Add meter success  ${meter_waterNumber}
    [Teardown]  Delete meter

IP-6075: edit exist meterNumber
    Given User in meter management page
    When Edit exist meterNumber
    Then Add meter success  ${meter_number_exist}

IP-6076: edit meterNumber
    Given User in meter management page
    When Edit meterNumber

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
    wait for loading page

Add meter number empty
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Cleck meter_nextButton

Add heat meter
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  @{list}[0]
    Platform_Device.Set meter_info  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over
    wait for loading page

Add water meter
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  ${meter_waterNumber}
    Set meter_actMedium  5
    Set meter_machMtype  type
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over
    wait for loading page

Add gas meter
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  ${meter_gasNumber}
    Platform_Device.Set meter_actMedium  1
    Platform_Device.Select meter_installTime
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Set meter_longitude  11.2313
    Platform_Device.Set meter_latitude  3.2341
    Platform_Device.Cleck meter_over
    wait for loading page

Add meter and concentrator
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  ${meter_gasNumber}
    Platform_Device.Set meter_actMedium  1
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Select table one row
    Platform_Device.Cleck meter_over
    wait for loading page

Add different organization meter
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  @{list}[0]
    Platform_Device.Set meter_actMedium  2
    Platform_Device.Set meter_orgTree  meterEditOrgTree_3_a
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over
    wait for loading page

Add meter additinal field
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  ${meter_waterNumber}
    Platform_Device.Set meter_actMedium  6
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Set meter_attributes  test2  123
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over
    sleep  2s

Edit exist meterNumber
    Select unGroup left tree button  ${meter_noGroup}
    Platform_Device.Click bottom button add
    Platform_Device.Set meter_meternumber  001
    Platform_Device.Cleck meter_nextButton

Edit meterNumber
    Select unGroup left tree button  ${meter_noGroup}
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button edit
    Platform_Device.Click meter_meterNumberEdit
    Platform_Device.Set meter_meternumber  ${meter_waterNumber}
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over

Delete meter
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

