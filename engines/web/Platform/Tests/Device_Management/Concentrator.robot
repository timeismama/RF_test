#-*- coding: utf-8 -*-
#coding: utf-8
*** Settings ***
Library   ExcelLibrary
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
${concentrator_noGroup}    未分组
${ROW_ID_0}  jqg_concentratorGrid_0
${ROW_ID_1}  jqg_concentratorGrid_1
${concentrator_number_empty}    *集中器编号不能为空
${concentrator_number_exist}    集中器已存在
${concentrator_area}    区域A
${concentrator_edit_area}   区域A1
${concentrator_org}   小区A
${sim_due_time_err}   SIM卡到期时间不能早于当前时间！
${concentrator_delarea}  测试删除区域


*** Test Cases ***
##   添加集中器，采集方式不可为空
#IP-2338: add concentrator way empty
#    Given User in concentrator management page
#    when Add concentrator way empty
#    Then Assess concentrator contain  *采集方式不能为空

##   添加集中器，编号不可为空
#IP-6099: add concentrator number empty
#    Given User in concentrator management page
#    when Add concentrator number empty
#    Then Assess concentrator contain  ${concentrator_number_empty}

##   添加集中器，编号不可重复
#IP-6104: add concentrator number exit
#    Given User in concentrator management page
#    when Add concentrator number exit
#    Then Assess concentrator contain  ${concentrator_number_empty}

##   (区域A)添加Radio集中器
#IP-6105: add Radio concentrator
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    when Add concentrator  ${concentrator_area}  jzq_radio_${random}  1
#    And Click concentrator_over
#    Then Assess concentrator contain  jzq_radio_${random}
#
##   (区域A)添加M-bus集中器
#IP-6106: add M-bus concentrator
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    when Add concentrator  ${concentrator_area}  jzq_m-bus_${random}  2
#    And Click concentrator_over
#    Then Assess concentrator contain  jzq_m-bus_${random}
#
##   (未分组)添加集中器
#IP-6107: add M-bus concentrator
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    when Add concentrator  ${concentrator_noGroup}  jzq_noGroup_${random}  1
#    And Click concentrator_over
#    Then Assess concentrator contain  jzq_noGroup_${random}

##   sim卡到期时间不能早于当前时间
#IP-6108: add Concentrator Sim Due Time
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    when Set sim due time concentrator
#    Then Assess concentrator contain  ${sim_due_time_err}

#  继续关联（集中器关联多个仪表）
IP-6109: add Concentrator relative device
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in concentrator management page
    when Add concentrator  ${concentrator_area}  jzq_m-bus_r${random}  2
    And Concentrator relative device
    And User in concentrator management page
    And accordion device info concentrator
    Then Assess concentrator contain  device_relate01
    And Assess concentrator contain  device_relate02

##  编辑集中器，编号不可重复
#IP-6175: edit concentrator number cannot repeat
#    Given User in concentrator management page
#    Then Edit concentrator number cannot repeat

##  编辑集中器（向导第一步和第二步）
#IP-6176: edit concentrator baseinfo
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    When Edit concentrator baseinfo ${concentrator_area}  jzq_edit_${random}  2
#    Then Assess concentrator contain  集中器jzq_edit_${random}修改成功！

##  编辑集中器(关联设备)
#IP-6177: edit concentrator relative device
#    ${random}  evaluate  random.randint(1,9999)  random
#    Given User in concentrator management page
#    When edit concentrator relative device
#    Then Assess concentrator contain  关联成功！

##  直接批量修改SIM到期时间(早于当前时间)
#IP-6180: test sim_due_time before systime
#    ${secs}  get time  epoch    Now-1day
#    ${yestoday}    get time    \    ${secs}
#    Given User in concentrator management page
#    When Set sim_due_time  ${yestoday}
#    Then Assess concentrator contain  * 选择的到期时间不可早于当前时间
#
##  批量修改SIM到期时间(晚于当前时间)
#IP-6181: edit concentrator relative device
#    ${secs}  get time  epoch    Now+100day
#    ${tomorrow}    get time    \    ${secs}
#    Given User in concentrator management page
#    When Set sim_due_time  ${tomorrow}
#    Then Assess concentrator contain  SIM卡到期时间更新成功

##  radio集中器不可直接关联设备
#IP-6182: radio concentrator relative device
#    Given User in concentrator management page
#    When Radio concentrator relative device  关联设备
#    Then Assess concentrator contain  只能对M-Bus集中器进行关联操作，请确认！

##  M-Bus集中器直接关联设备
#IP-6183: M-bus concentrator relative device
#    Given User in concentrator management page
#    When M-Bus concentrator relative device  关联设备
#    And Click buttom relevance button
#    Then Assess concentrator contain  关联成功
#
##  radio集中器不可直接取消关联设备
#IP-6184: radio concentrator cancel relative device
#    Given User in concentrator management page
#    When Radio concentrator relative device  取消关联设备
#    Then Assess concentrator contain  只能对M-Bus集中器进行取消关联操作，请确认！
#
##  M-bus集中器直接取消关联设备
#IP-6185: M-bus concentrator cancel relative device
#    Given User in concentrator management page
#    When M-bus concentrator relative device  取消关联设备
#    And Platform_Concentrator.Click buttom cancel relevance button
#    And Platform_Concentrator.Click button confirm
#    Then Assess concentrator contain  取消关联！

#  M-bus集中器直接取消关联设备
IP-6186: export concentrator accordion_meter_info
    Given User in concentrator management page
    Then Export concentrator accordion_meter_info


##  集中器详情编辑基本信息
#IP-3890: concentrator detail edit baseinfo
#    Given User in concentrator management page
#    Then concentrator detail edit baseinfo

#  IP-2386: 集中器详情验证关联设备   IP6109已验证此用例

##  单个删除集中器
#IP-6178: edit concentrator relative device
#    Given User in concentrator management page
#    When delete concentrator one
#    Then Assess concentrator contain  删除成功！

##  全部删除集中器
#IP-6179: edit concentrator relative device
#    Given User in concentrator management page
#    When delete concentrator all
#    Then Assess concentrator contain  符合条件的集中器信息已全部删除！

*** Keywords ***
User in concentrator management page
    reload page
    Platform_TopMenu.Get into concentrator page
    wait for loading page

#添加集中器，编号不可为空
Add concentrator number empty
    Platform_Concentrator.Click bottom button add
    Platform_Concentrator.Click concentrator_nextButton

#添加集中器，采集方式不可为空
Add concentrator way empty
    Platform_Concentrator.Click bottom button add
    Platform_concentrator.Set concentrator_number  jzq_way01
    Platform_concentrator.Set concentrator_Way  0
    Platform_Concentrator.Click concentrator_nextButton

#集中器编号重复
Add concentrator number exit
    Select unGroup left tree button  ${concentrator_noGroup}
    ${exist_number}  Get exist_concentrator_number
    Platform_Concentrator.Click bottom button add
    Platform_concentrator.Set concentrator_number  ${exist_number}
    Platform_concentrator.Click concentrator_nextButton

#  添加集中器
Add concentrator
    [Arguments]  ${area}  ${number}  ${way}
    ${secs}  get time  epoch    Now+100day
    ${due_time}    get time    \    ${secs}
    ${install_time}   get time
    Select unGroup left tree button  ${area}
    Platform_Concentrator.Click bottom button add
    Platform_concentrator.Set concentrator_number   ${number}
    Platform_Concentrator.Set concentrator_info  test01  changshang01  SIM01   ${way}   ${due_time}   1  hw_001  sw_001  ${install_time}   test01  test
    Platform_Concentrator.Click concentrator_nextButton
    Platform_Concentrator.Set concentrator_longitude  114.26
    Platform_Concentrator.Set concentrator_latitude  34.15


Set sim due time yestoday
    ${secs}  get time  epoch    Now-1day
    ${yestoday}    get time    \    ${secs}
    Select unGroup left tree button  ${concentrator_area}
    Platform_Concentrator.Click bottom button add
    Platform_concentrator.Set concentrator_number   jzq123
    Platform_Concentrator.Set concentrator sim due time  ${yestoday}
    Platform_Concentrator.Click concentrator_nextButton
#   关联多个仪表
Concentrator relative device
    Platform_Concentrator.Click concentrator_nextButton_two
    sleep  3s
    Platform_Concentrator.Sel device by number  device_relate01
    Platform_Concentrator.Click Enter
    Platform_Concentrator.Click sel device
    Platform_Concentrator.Click relevance button
    sleep  3s
    Platform_Concentrator.Sel device by number  device_relate02
    Platform_Concentrator.Click Enter
    Platform_Concentrator.Click sel device
    Platform_Concentrator.Click relevance button

#   进入集中器详情
accordion device info concentrator
    User in concentrator management page
    Select unGroup left tree button  ${concentrator_area}
    Platform_Concentrator.Sel concentrator by number  jzq_m-bus_r
    Platform_Concentrator.Click SEL Enter
    Platform_Concentrator.Click exist concentrator number
    sleep  1s


# 编辑（编号不可重复）
Edit concentrator number cannot repeat
    Select unGroup left tree button  ${concentrator_area}
    sleep  1s
    ${exist_concentrator}  Platform_Concentrator.Get exist_concentrator_number
    Select list one row  ${ROW_ID_1}
    Platform_Concentrator.Click buttom button  编辑
    sleep  1s
    Platform_Concentrator.Set concentrator_number  ${exist_concentrator}
    Platform_Concentrator.Click concentrator_nextButton
    Assess concentrator contain  编号为${exist_concentrator}的集中器已存在，请确认！

# 编辑(向导第一步和第二步)
Edit concentrator baseinfo
    [Arguments]  ${area}  ${number}  ${way}
    ${secs}  get time  epoch    Now+100day
    ${due_time}    get time    \    ${secs}
    ${install_time}   get time
    Select unGroup left tree button  ${area}
    sleep  1s
    Select list one row  ${ROW_ID_1}
    Platform_Concentrator.Click buttom button  编辑
    Platform_concentrator.Set concentrator_number   ${number}
    Platform_Concentrator.Set concentrator_info  test02  changshang02  SIM02   ${way}   ${due_time} 2  hw_002  sw_002   ${install_time} test02  test2
    Platform_Concentrator.Click concentrator_nextButton
    Platform_Concentrator.Set concentrator_longitude  114.26
    Platform_Concentrator.Set concentrator_latitude  34.15
    Platform_Concentrator.Click concentrator_over

#编辑操作，关联设备
edit concentrator relative device
    Platform_Concentrator.Sel concentrator by way  2   #查询出M_bus类型的集中器
    sleep  1s
    ${exist_concentrator}  Platform_Concentrator.Get exist_concentrator_number
    Select list one row  ${ROW_ID_0}
    Platform_Concentrator.Click buttom button  编辑
    Platform_Concentrator.Click concentrator_nextButton
    Platform_Concentrator.Click concentrator_nextButton_two
    Platform_Concentrator.Sel device by number  device_edit_relate01
    Platform_Concentrator.Click Enter
    Platform_Concentrator.Click sel device
    Platform_Concentrator.Click relevance button
    sleep  1s

#批量修改SIM卡到期时间
Set sim_due_time
    [Arguments]  ${time}
    sleep  1s
    Select list one row  ${ROW_ID_0}
    Select list one row  ${ROW_ID_1}
    Platform_Concentrator.Click buttom button  修改SIM卡到期时间
    Platform_Concentrator.Set sim due time  ${time}
    sleep  1s
    Platform_Concentrator.Click button confirm
    sleep  1s


Radio concentrator relative device
    [Arguments]  ${button_name}
    Platform_Concentrator.Sel concentrator by way  1   #查询出radio类型的集中器
    sleep  1s
    Select list one row  ${ROW_ID_0}
    Platform_Concentrator.Click buttom button  ${button_name}

M-Bus concentrator relative device
    [Arguments]  ${button_name}
    Platform_Concentrator.Sel concentrator by way  2   #查询出radio类型的集中器
    sleep  1s
    Select list one row  ${ROW_ID_0}
    Platform_Concentrator.Click buttom button  ${button_name}
    Platform_Concentrator.Click sel device
    sleep  1s


concentrator detail edit baseinfo
    ${random}  evaluate  random.randint(1,9999)  random
    ${install_time}   get time
    @{detail_list1}  Create List  jzq_detail_edit${random}  facturer02  detail_SIM01  M-bus  hw_002  sw_002  install_loc02  zichan02
    Platform_concentrator.Click exist concentrator number        #点击进入详情页
    Platform_concentrator.Click concentrator_detail_baseinfo_edit
    sleep  1s
    Platform_concentrator.Set concentrator_detail_baseinfo  @{detail_list1}[0]  @{detail_list1}[7]   @{detail_list1}[1]  @{detail_list1}[2]  2  @{detail_list1}[4]  @{detail_list1}[5]  @{detail_list1}[6]
    Platform_concentrator.Click concentrator_detail_edit_Over
    sleep  1s
    ${detail_list2}  Platform_concentrator.Get concentrator_detail_baseinfo
    Should Be Equal   ${detail_list1}  ${detail_list2}

#关联设备导出
Export concentrator accordion_meter_info
    Platform_concentrator.Sel concentrator by number  jzq_detail_edit
    Platform_concentrator.Click exist concentrator number   #点击进入详情
    ${number}  Platform_concentrator.Get exist_concentrator_number
    log to console  ${number}
    sleep  1s
    Platform_concentrator.Click export   导出
    sleep  10s
    ${y}   get time   year
    ${m}   get time   month
    ${d}   get time   day
    ${date}  Catenate  SEPARATOR=     ${y}  ${m}  ${d}
    file_should_exist    C:\\Users\\ziwg9\\Downloads\\集中器${number}关联仪表统计表_${date}.xlsx

# 读取excel内容
    open excel  C:\\Users\\ziwg9\\Downloads\\集中器${number}关联仪表统计表_${date}.xlsx



#单个删除
delete concentrator one
    #Select unGroup left tree button  ${concentrator_delarea}
    sleep  1s
    Select list one row  ${ROW_ID_0}
    Platform_Concentrator.Click buttom button  删除
    Platform_Common.Set deletde reason  1
    Platform_Concentrator.Click button confirm

 #全部删除
delete concentrator all
    #Select unGroup left tree button  ${concentrator_delarea}
    Platform_Concentrator.Click buttom button  全部删除
    Platform_Common.Set deletde reason  2
    Platform_Concentrator.Click button confirm



