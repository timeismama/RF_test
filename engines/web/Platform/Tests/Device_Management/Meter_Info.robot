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
${meter_changeinfo}   换表记录添加成功！
${meter_editinfo}   修改成功！
${meter_change_failed}  请设置或选择要被换掉的旧表！
${meter relative M-Bus_failed}  请选择要关联的M-Bus集中器！
${meter relative M-Bus_success}  关联成功
${meter_Cancel_relative M-Bus_failed}  请选择要取消关联M-Bus集中器的仪表！
${meter_Cancel_relative M-Bus_success}  仪表取消关联成功!
${web_PLATFORM_METER_OLD_VAL}  endMeasGrid
${web_PLATFORM_METER_NEW_NUMBER}  newmeterGrid
${web_PLATFORM_METER_START_VAL}  startMeasGrid
${web_PLATFORM_METER_CONCENTRATOR}  connectConcentratorGrid

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

#仪表编号不可重复
IP-6075: edit exist meterNumber
    Given User in meter management page
    When Edit exist meterNumber
    Then Add meter success  ${meter_number_exist}


#编辑仪表编号
IP-6076: edit meterNumber
    Given User in meter management page
    When Edit meterNumber
    Then Add meter success  ${meter_number_exist}

#去换表（新表选择旧表）
IP-6077: change meter
    Given User in meter management page
    When Change meter
    ${info}  Platform_Common.Get Info_msg
    Then should be equal as strings  ${info}  ${meter_changeinfo}

# 编辑仪表经纬度等其他信息
IP-6078: edit meterother
    Given User in meter management page
    When Edit meterother
    ${info}  Platform_Common.Get Info_msg
    Then should_contain  ${info}  ${meter_editinfo}

#  更换仪表--未选择仪表
IP-6082: change meter number empty
    Given User in meter management page
    sleep  1s
    When Edit meter unsel number
    ${warn}  Platform_Common.Get warn_msg
    Then should be equal as strings  ${warn}  ${meter_change_failed}

#  更换仪表--选择新表记录更换
IP-6083: change meter sel newmeter
    Given User in meter management page
    When Change meter sel newmeter
    ${info}  Platform_Common.Get Info_msg
    Then should be equal as strings  ${info}  ${meter_changeinfo}

#  关联M-Bus集中器按钮--未选择仪表
IP-6084: meter relative M-Bus unsel number
    Given User in meter management page
    When Meter relative M-Bus unsel number
    ${warn}  Platform_Common.Get warn_msg
    Then should be equal as strings  ${warn}  ${meter relative M-Bus_failed}

#  关联M-Bus集中器
IP-6085: meter relative M-Bus sel number
    Given User in meter management page
    When Meter relative M-Bus sel number
    ${info}  Platform_Common.Get info_msg
    Then should_contain  ${info}  ${meter relative M-Bus_success}

#  取消关联M-Bus集中器按钮--未选择仪表
IP-6086: edit meter Cancel_M-Bus unsel number
    Given User in meter management page
    When Meter Cancel_relative M-Bus unsel number
    ${warn}  Platform_Common.Get warn_msg
    Then should be equal as strings  ${warn}  ${meter_Cancel_relative M-Bus_failed}

#  取消关联M-Bus集中器
IP-6087: edit meter Cancel_M-Bus unsel number
    Given User in meter management page
    When Meter Cancel_relative M-Bus sel number
    ${info}  Platform_Common.Get info_msg
    Then should be equal as strings  ${info}  ${meter_Cancel_relative M-Bus_success}

*** Keywords ***
User in meter management page
    reload page
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
    Platform_Device.Set meter_repeat_meternumber  ${meter_waterNumber}
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_nextButton
    Platform_Device.Cleck meter_over

#去换表
Change meter
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    sleep  1s
    Platform_Device.Click bottom button edit
    sleep  1s
    Platform_Device.Click meter_meterReplace
    Platform_Device.Click list by value  ${web_PLATFORM_METER_OLD_VAL}  2020-02-14
    Platform_Device.Click changemeter_nextButton    #换表下一步
    Platform_Device.Click list by value  ${web_PLATFORM_METER_NEW_NUMBER}  W001
    Platform_Device.Click changemeter_nextButton    #换表下一步
    Platform_Device.Click list by value  ${web_PLATFORM_METER_START_VAL}  2020-02-28
    Platform_Device.Click changemeter_nextButton  #下一步
    Platform_Device.SET changemeter_ITEM  test  test  test   # 换表人 换表原因  备注
    Platform_Device.Click changemeter_over    #点击完成
    Platform_Common.Click button_confirm  #提示框点击确定
    sleep  1s

#编辑仪表其他信息
Edit meterother
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    sleep  1s
    Platform_Device.Click bottom button edit
    Platform_Device.Cleck meter_nextButton  #下一步
    Platform_Device.Cleck meter_nextButton  #下一步
    Platform_Device.Set meter_longitude  121.389276
    Platform_Device.Set meter_latitude  31.629969
    Platform_Device.Cleck meter_over    #点击完成

#未选择仪表，点击更换换表
Edit meter unsel number
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Platform_Device.Click bottom button replaceMeter

#更换仪表，选择新表更换
Change meter sel newmeter
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button replaceMeter  #更换仪表
    Platform_Device.Click list by value  ${web_PLATFORM_METER_OLD_VAL}  2020-02-14
    Platform_Device.Click changemeter_nextButton    #换表下一步
    Platform_Device.Click list by value  ${web_PLATFORM_METER_NEW_NUMBER}  W001
    Platform_Device.Click changemeter_nextButton    #换表下一步
    Platform_Device.Click list by value  ${web_PLATFORM_METER_START_VAL}  2020-02-28
    Platform_Device.Click changemeter_nextButton    #换表下一步
    Platform_Device.SET changemeter_ITEM  test  test  test   # 换表人 换表原因  备注
    Platform_Device.Click changemeter_over  #完成
    Platform_Common.Click button_confirm  #提示框点击确定

#未选择仪表，点击关联M-Bus集中器按钮
Meter relative M-Bus unsel number
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Platform_Device.Click bottom button correlationConcentrator

#选择仪表，关联M-Bus集中器
Meter relative M-Bus sel number
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button correlationConcentrator
    Platform_Device.Click list by value  ${web_PLATFORM_METER_CONCENTRATOR}  M001
    Platform_Device.Click meter button connect_concentrator

#未选择仪表，点击取消关联M-Bus集中器按钮
Meter Cancel_relative M-Bus unsel number
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Platform_Device.Click bottom button cancelTheAssociationConcentrator

#选择仪表，取消关联M-Bus集中器
Meter Cancel_relative M-Bus sel number
    Select unGroup left tree button  ${meter_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button cancelTheAssociationConcentrator
    Platform_Device.Click bottom button cancelTheAssociationConcentratorConfirm

Delete meter
    Select list one row  ${ROW_ID}
    Platform_Device.Click bottom button deleted
    Platform_Common.Set deletde reason  0
    Platform_Common.Click delete confirm button

deltedAll meter
    Platform_Device.Click bottom button deletedAll
    Platform_Common.Set deletde reason  1
    Platform_Common.Click delete confirm button

Replace meter
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

