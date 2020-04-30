#-*- coding: utf-8 -*-
#coding: utf-8
*** Settings ***

Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
${humiture_noGroup}    未分组
${humiture_area}    区域A
${humiture_edit_area}   区域A1
${humiture_org}   小区A
${humiture_area1}    区域B
${humiture_area2}   区域B1
${humiture_addsuccess}  添加成功
${humiture_editsuccess}  温湿度传感器修改成功！
${humiture_number_empty}  *设备编号不能为空
${humiture_number_exist}  *设备编号已存在
${ROW_ID}  jqg_humitureGrid_0
${humiture_distance}  humitureGrid_distanceHeatSourceName
${humiture_number}  humitureGrid_meterNumber
${humiture_del_num}  wsq_del001
${humiture_org_noQuick_update}  jq_detail_edit ng-hide
${cus_addnum}  kh02
${cus_editnum}  kh021
${refresh_success}   刷新成功
${hide_column}  表端报警
${sel_number}  wsq_sel001

*** Test Cases ***
## 温湿器详情页展示
IP-5013: humiture detail
    Given User in humiture management page
    Then humiture detail Success

#按设备编号排序
IP-6094: On the header to sort humiture number
    Given User in humiture management page
    sleep  2s
    ${list}  Get humiture_number list
    ${list1}  Sort list  ${list}
    log to console  ${list1}
    When Platform_Humiture.Click on the header to sort  ${humiture_number}
    ${list2}  Get humiture_number list
    log to console  ${list2}

#   温湿器编号不可为空
IP-6091: add humiture number empty
    Given User in humiture management page
    When Add humiture number empty
    Then Assess humiture contain  ${humiture_number_empty}

#   添加温湿器(有组织)
IP-6092: add humiture
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in humiture management page
    When Add humiture  wsq${random}
    Then Assess humiture contain  wsq${random}

#   编辑温湿器(有组织)
IP-6093: edit humiture
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in humiture management page
    When Edit humiture  wsq${random}
    Then Assess humiture contain  wsq${random}

##按距热点排序（排序问题后续解决）
#IP-6094: On the header to sort humiture name
#    Given User in humiture management page
#    sleep  2s
#    When Platform_Humiture.Click on the header to sort  ${humiture_title_name}

#   添加温湿器(未分组)
IP-6100: add humiture noGroup
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in humiture management page
    When Add humiture_noGroup  wsq_nogroup${random}
    Then Assess humiture contain  wsq_nogroup${random}

#   编辑温湿器(未分组)
IP-6101: add humiture noGroup
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in humiture management page
    When Edit humiture_noGroup  wsq_nogroup${random}
    Then Assess humiture contain  wsq_nogroup${random}

#   温湿器编号不可重复
IP-6103: add humiture_number exit
    Given User in humiture management page
    When Add humiture number exit
    Then Assess humiture contain  ${humiture_number_exist}

#   温湿器详情页跳转
IP-6118: jump humiture detail
    Given User in humiture management page
    Then Jump humiture detail

#   (未分组)温湿器详情页-编辑设备基本信息
IP-6123: humiture detail edit baseinfo noGroup
    Given User in humiture management page
    Then Humiture detail edit baseinfo noGroup

#   (有组织)温湿器详情页-编辑设备基本信息
IP-6124: humiture detail edit baseinfo org
    Given User in humiture management page
    Then Humiture detail edit baseinfo org

#   (未分组)温湿器详情页-所属组织无快捷编辑按钮
IP-6140: humiture detail noGroup noQuickUpdateOrg
    Given User in humiture management page
    When Humiture Jump detail noGroup
    Then Humiture detail noGroup noQuickUpdateOrg

##   温湿器详情页-修改所属组织的经纬度（需求已改，此功能已不存在）
#IP-6143: humiture detail edit orgMap
#    Given User in humiture management page
#    When Humiture detail edit orgMap
#    And Platform_TopMenu.Get into organization page
#    Then Assess humiture contain  ${humiture_edit_area}

#   温湿器详情页-所属组织下增加客户
IP-6144: humiture detail edit org adduser
    Given User in humiture management page
    When Humiture detail edit org customer  ${cus_addnum}
    Then Add User success  ${cus_addnum}

#   温湿器详情页-所属组织下编辑客户
IP-6145: humiture detail edit org edituser
    Given User in humiture management page
    When Humiture detail edit org customer  ${cus_editnum}
    Then Add User success  ${cus_editnum}

#   温湿器详情页-抄表数据刷新
IP-6146: humiture detail meas_val refresh
    Given User in humiture management page
    When Humiture detail meas_val refresh
    Then Assess humiture contain  ${refresh_success}
    And humiture detail unsel meas_val

#   温湿器详情页-抄表数据设置列
IP-6147: humiture detail meas_val setColumn
    Given User in humiture management page
    When Humiture detail meas_val setColumn
    Then humiture detail column hide success

#   温湿器详情页-抄表数据导出
IP-6148: export humiture detail meas_val
    Given User in humiture management page
    When export humiture detail meas_val
    Then Export humiture detail meas_val success

#   温湿器详情页-所属组织改为上层组织
IP-6141: humiture detail edit upper org
    Given User in humiture management page
    When Humiture detail edit upper org
    Then Assess humiture contain  区域B-小区A

##   温湿器详情页-修改所属组织名称（暂时未定位成功，后续增加id）
#IP-6142: humiture detail edit orgName
#    Given User in humiture management page
#    When Humiture detail edit orgName
#    #Then Assess humiture contain  ${humiture_edit_area}

# 按资产号查询温湿器
IP-6097: select Humiture By number
    Given User in humiture management page
    Then Select Humiture By Number Success

# 按位置过滤温湿器（冷山）
IP-6098: select Humiture By Position
    Given User in humiture management page
    When Platform_Humiture.Sel Position  1
    #按冷山过滤后，页面不存在中间位置的设备
    Then Platform_Humiture.ASSESS Sel Humiture By Position  中间

# 单个删除温湿器
IP-6095: delete humiture_one
    Given User in humiture management page
    sleep  2s
    When Add humiture  ${humiture_del_num}
    And delete humiture  ${humiture_del_num}
    Then Assess humiture not_contain  ${humiture_del_num}
# 删除全部温湿器
IP-6096: delete humiture_all
    ${random}  evaluate  random.randint(1,9999)  random
    Given User in humiture management page
    sleep  1s
    When Add humiture  wsq_del01${random}
    When Add humiture  wsqd_el02${random}
    When delete humiture_all
    ${count}  Get humiture Count
    Then should be equal as strings  ${count}  0

*** Keywords ***
User in humiture management page
    reload page
    Platform_TopMenu.Get into humiture page
    wait for loading page

#温湿器编号为空
Add humiture number empty
    Select unGroup left tree button  ${humiture_noGroup}
    Platform_Humiture.Click button  添加
    Platform_Humiture.Click humiture_nextButton
#温湿器编号重复
Add humiture number exit
    Select unGroup left tree button  ${humiture_noGroup}
    ${exist_number}  Get exist_humiture_number
    Platform_Humiture.Click button  添加
    Platform_Humiture.Set humiture_number  ${exist_number}
    Platform_Humiture.Click humiture_nextButton
#添加温湿器（有组织）
Add humiture
    [Arguments]  ${humitureNumber}
    Select unGroup left tree button  ${humiture_area}
    Platform_Humiture.Click button  添加
    sleep  1s
    Platform_Humiture.Set humiture_number  ${humitureNumber}
    Set humiture_info  wsq  2  2  1  北  卧室  备注test
    Platform_Humiture.Click humiture_nextButton
    Platform_Humiture.Set HUMITURE_longitude  112.9
    Platform_Humiture.Set HUMITURE_latitude  36.5
    Platform_Humiture.Click HUMITURE_over
#添加温湿器（未分组）
Add humiture_noGroup
    [Arguments]  ${humitureNumber}
    Select unGroup left tree button  ${humiture_noGroup}
    Platform_Humiture.Click button  添加
    sleep  1s
    Platform_Humiture.Set humiture_number  ${humitureNumber}
    Set humiture_noGroyp_info  wsq   卧室  备注test
    Platform_Humiture.Click humiture_nextButton
    Platform_Humiture.Set HUMITURE_longitude  112.9
    Platform_Humiture.Set HUMITURE_latitude  36.5
    Platform_Humiture.Click HUMITURE_over
#编辑温湿器（有组织）
Edit humiture
    [Arguments]  ${humitureNumber}
    Select unGroup left tree button  ${humiture_area}
    sleep  1s
    Select list one row  ${ROW_ID}
    Platform_Humiture.Click button  编辑
    sleep  1s
    Platform_Humiture.Set humiture_number  ${humitureNumber}
    Set humiture_info  wsq1  1  1  2  南  卧室1  备注test1
    Platform_Humiture.Click humiture_nextButton
    Platform_Humiture.Set HUMITURE_longitude  112.9
    Platform_Humiture.Set HUMITURE_latitude  36.15
    Platform_Humiture.Click HUMITURE_over
#编辑温湿器（未分组）
Edit humiture_noGroup
    [Arguments]  ${humitureNumber}
    Select unGroup left tree button  ${humiture_noGroup}
    sleep  1s
    Select list one row  ${ROW_ID}
    Platform_Humiture.Click button  编辑
    sleep  1s
    Platform_Humiture.Set humiture_number  ${humitureNumber}
    Set humiture_noGroyp_info  wsq1  卧室1  备注test1
    Platform_Humiture.Click humiture_nextButton
    Platform_Humiture.Set HUMITURE_longitude  112.9
    Platform_Humiture.Set HUMITURE_latitude  36.15
    Platform_Humiture.Click HUMITURE_over
#   单个删除
Delete humiture
    [Arguments]  ${humitureNumber}
    Select unGroup left tree button  ${humiture_area}
    Select list one row  ${ROW_ID}
    Platform_Humiture.Click button  删除
    Platform_Common.Click delete confirm button
#   全部删除
Delete humiture_all
    Select unGroup left tree button  ${humiture_area}
    Platform_Humiture.Click button  全部删除
    Platform_Common.Click delete confirm button
#排序
On the header to sort humiture name
    Platform_Humiture.Click on the header to sort  ${humiture_title_name}
#   详情跳转
Jump humiture detail
    Select unGroup left tree button  ${humiture_area}
    sleep  1s
    ${list_info}  Platform_Humiture.Get humiture_list_info
    Platform_Humiture.Click humiture_list_number         #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate            #展开组织信息
    ${detail_info}  Platform_Humiture.Get humiture_Detail_info
    Should Be Equal   ${list_info}  ${detail_info}
#详情页编辑基本信息(未分组)
Humiture detail edit baseinfo noGroup
    ${random}  evaluate  random.randint(1,9999)  random
    @{edit_list1}  Create List  wsq_nogroup${random}  卧室2   test2
    Select unGroup left tree button  ${humiture_noGroup}
    Platform_Humiture.Click humiture_list_number         #点击进入详情页
    Platform_Humiture.Click humiture_detail_baseinfo_edit
    Platform_Humiture.Set humiture_detail_baseinfo  @{edit_list1}[0]   wsq1   @{edit_list1}[1]  @{edit_list1}[2]
    Platform_Humiture.Click humiture_detail_edit_Over
    sleep  1s
    ${edit_list2}  Platform_Humiture.Get humiture_detail_baseinfo_by_org  noGroup
    Should Be Equal   ${edit_list1}  ${edit_list2}
#详情页编辑基本信息(有组织)
Humiture detail edit baseinfo org
    ${random}  evaluate  random.randint(1,9999)  random
    @{edit_list1}  Create List  wsq_area${random}  近  高  中间  北1  卧室1  test1
    Select unGroup left tree button  ${humiture_area}
    Platform_Humiture.Click humiture_list_number         #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate            #展开组织信息
    Platform_Humiture.Click humiture_detail_baseinfo_edit
    Platform_Humiture.Set humiture_detail_baseinfo_org  @{edit_list1}[0]  wsq1  1  1  2  @{edit_list1}[4]  @{edit_list1}[5]  @{edit_list1}[6]
    Platform_Humiture.Click humiture_detail_edit_Over
    sleep  1s
    ${edit_list2}  Platform_Humiture.Get humiture_detail_baseinfo_by_org  org
    Should Be Equal   ${edit_list1}  ${edit_list2}
# 未分组温湿器，跳转到详情页
Humiture Jump detail noGroup
    Select unGroup left tree button  ${humiture_nogroup}
    Platform_Humiture.Click humiture_list_number         #点击进入详情页
    sleep  2s
# 未分组温湿器，所属组织无快捷编辑按钮
Humiture detail noGroup noQuickUpdateOrg
    ${edit_attribute}  Platform_Humiture.Get humiture_detail_noGroup_quickUpdate_Attribute
    Then should be equal as strings  ${edit_attribute}  ${humiture_org_noQuick_update}
#选择区域A--小区A的温湿器进入详情，修改上级组织为区域B
Humiture detail edit upper org
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate       #展开组织信息
    Platform_Humiture.Click humiture_detail_org_quick_button     #编辑
    Platform_Common.Click button_confirm
    Platform_Humiture.Set org_tree   区域B
    Platform_Humiture.Click humiture_detail_edit_org_Over
    sleep  1s
#选择区域B的温湿器进入详情，修改所属组织为区域B1
Humiture detail edit orgName
    Select unGroup left tree button  ${humiture_area1}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate       #展开组织信息
    Platform_Humiture.Click humiture_detail_org_quick_button     #编辑
    Platform_Common.Click button_confirm
    Platform_Humiture.Set org_name   ${humiture_area2}
    sleep  1s
    Platform_Humiture.Click humiture_detail_edit_org_Over
#选择区域A的温湿器进入详情，修改组织的经纬度
Humiture detail edit orgMap
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate       #展开组织信息
    Platform_Humiture.Click humiture_detail_org_quick_button     #编辑
    Platform_Common.Click button_confirm
    Platform_Humiture.Click humiture_detail_edit_org_Next
    sleep  2s
    Platform_Humiture.SET humiture_detail_edit_Map  116.28  36.12
    sleep  2s
    Platform_Humiture.Click humiture_detail_edit_org_Over
#进入组织机构，判断区域A的经纬度修改成功
Humiture detail edit orgMap Success
    Platform_TopMenu.Get into organization page
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate       #展开组织信息
    Platform_Humiture.Click humiture_detail_org_quick_button     #编辑
    Platform_Common.Click button_confirm
    Platform_Humiture.Click humiture_detail_edit_org_Next
    sleep  2s
    Platform_Humiture.SET humiture_detail_edit_Map  116.28  36.12
    sleep  2s
    Platform_Humiture.Click humiture_detail_edit_org_Over
#   温湿器详情页-所属组织下增加、编辑客户
Humiture detail edit org customer
    [Arguments]  ${cus_num}
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    Platform_Humiture.Click humiture_org_quickUpdate       #展开组织信息
    Platform_Humiture.Click humiture_detail_org_quick_button     #编辑
    Platform_Common.Click button_confirm
    Platform_Humiture.Click humiture_detail_edit_org_Next
    Platform_Humiture.Set humiture_detail_edit_org_cus_num  ${cus_num}
    Platform_Humiture.Click humiture_detail_edit_org_Over
    sleep  2s
#   进入客户管理，查看客户是否添加成功
Add User success
    [Arguments]  ${cus_num}
    Platform_TopMenu.Get into customer page
    wait for loading page
    reload page
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Assess humiture contain  ${cus_num}
#   温湿器详情，抄表数据刷新
Humiture detail meas_val refresh
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情
    Platform_Humiture.Click sel meas_val
    Platform_Humiture.Click meas_val_pager_left   刷新
    sleep  1s
#设置列
Humiture detail meas_val setColumn
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情
    Platform_Humiture.Click meas_val_pager_left   设置列
    Platform_Humiture.humiture detail meas_val set column  ${hide_column}
    Platform_Humiture.humiture detail meas_val set column confirm
    sleep  1s
#温湿器抄表数据导出
export humiture detail meas_val
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情
    sleep  1s
    Platform_Humiture.Click meas_val_pager_left   导出
    sleep  10s
#    导出成功验证(后期会修改下载路径和导出名)
Export humiture detail meas_val success
    file_should_exist    C:\\Users\\ziwg9\\Downloads\\w001温湿度传感器抄表记录20200423.xlsx
# 按资产号搜索
Select Humiture By Number Success
    Platform_Humiture.Input search huniture number  ${sel_number}
    sleep  1s
    Platform_Humiture.Click Enter
    sleep  1s
    # 获取查询到第一个温湿器编号
    ${number}  Platform_Humiture.Get exist_humiture_number
    should be equal as strings  ${number}  ${sel_number}
# 温湿器详情页数据展示
humiture detail Success
    ${detail_left_button_list} =  Create List  刷新  导出  设置列
    ${TimeRange_list} =  Create List  一周内  一个月内  三个月内  半年内  一年内
    Select left tree by orgname  ${humiture_area}
    Select unGroup left tree button  ${humiture_org}
    Platform_Humiture.Click humiture_list_number           #点击进入详情页
    sleep  2s
    @{left_button}  Platform_Humiture.Get humiture Detail MeasVal Pager_left Button
    ${TimeRange}  Platform_Humiture.Get humiture Detail MeasVal TimeRange
    Should Be Equal  ${detail_left_button_list}  ${left_button}
    Should Be Equal  ${TimeRange_list}  ${TimeRange}


