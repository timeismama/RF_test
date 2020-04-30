*** Settings ***
Resource  ../Platform_Common.robot


*** Variables ***
${humiture_PADER}  humiturePager_left
${web_PLATFORM_Humiture_GUIDENEXT}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/a[3]
${web_PLATFORM_HUMITURE_NUMBER}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[1]/div[1]/input
${web_PLATFORM_HUMITURE_ASSETNUMBER}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[1]/div[2]/input
${web_PLATFORM_HUMITURE_INSTALLTIME}  xpath://*[@id="humitureInstallTime_7"]
${web_PLATFORM_HUMITURE_INSTALLOC}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[7]/div[1]/input
${web_PLATFORM_HUMITURE_REMARK}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[8]/div[1]/input
${web_PLATFORM_HUMITURE_LONGITUDE}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[2]/div/div[2]/ul/li[1]/div[1]/input
${web_PLATFORM_HUMITURE_LATITUDE}   xpath:/html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[2]/div/div[2]/ul/li[1]/div[2]/input
${web_PLATFORM_HUMITURE_GUIDEOVER}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/a[4]
${web_PLATFORM_HUMITURE_DISTANCE}   xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[4]/div[1]/select
${web_PLATFORM_HUMITURE_FLOOR}   xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[4]/div[2]/select
${web_PLATFORM_HUMITURE_POSITION}  xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[5]/div[1]/select
${web_PLATFORM_HUMITURE_ROOMLOC}   xpath://html/body/div[1]/div[2]/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[5]/div[2]/input
${web_PLATFORM_HUMITURE_COUNT}  xpath://*[@id="table"]/div[2]/table/tbody/tr/td[4]/span[2]
# 列表的基本信息
${web_PLATFORM_HUMITURE_EXIST_NUMBER}  xpath://td[@aria-describedby='humitureGrid_meterNumber']/span
${web_PLATFORM_HUMITURE_LIST_INSTALLTIME}  xpath://td[@aria-describedby='humitureGrid_installTime']
${web_PLATFORM_HUMITURE_LIST_INSTALLLOC}  xpath://td[@aria-describedby='humitureGrid_installLoc']
${web_PLATFORM_HUMITURE_LIST_ROOMLOC}  xpath://td[@aria-describedby='humitureGrid_roomLoc']
${web_PLATFORM_HUMITURE_LIST_DISTANCE}  xpath://td[@aria-describedby='humitureGrid_distanceHeatSourceName']
# 详情页的基本信息
${web_PLATFORM_HUMITURE_DETAIL_NUMBER}  xpath://span[@ng-bind='vm.meterDetail.meter_number']
${web_PLATFORM_HUMITURE_DETAIL_INSTALLTIME}  xpath://span[@ng-bind='vm.meterDetail.meter_install_time']
${web_PLATFORM_HUMITURE_DETAIL_INSTALLLOC}  xpath://span[@ng-bind='vm.meterDetail.meter_install_loc']
${web_PLATFORM_HUMITURE_DETAIL_FLOOR}  xpath://span[@ng-bind='vm.meterDetail.floor']
${web_PLATFORM_HUMITURE_DETAIL_POSITION}  xpath://span[@ng-bind='vm.meterDetail.dm_position']
${web_PLATFORM_HUMITURE_DETAIL_REMARK}  xpath://span[@ng-bind='vm.meterDetail.meter_remark']
${web_PLATFORM_HUMITURE_DETAIL_ROOMLOC}  xpath://span[@ng-bind='vm.meterDetail.room_loc']
${web_PLATFORM_HUMITURE_DETAIL_DISTANCE}  xpath://span[@ng-bind='vm.meterDetail.heat_source']

#展开组织信息
${web_PLATFORM_HUMITURE_SHOW_ORG_INFO}  xpath://*[@id="ui-id-7"]/span
#组织信息编辑按钮
${web_PLATFORM_HUMITURE_ORG_QUICK_UPDATE_BUTTON}  xpath://div[@ng-click='quickUpdateOrg();']

#详情页基本信息编辑按钮
${web_PLATFORM_HUMITURE_DETAIL_BASEINFO_EDIT}  xpath://div[@ng-click='quickUpdateMeter(vm.usageType);']
#详情页编辑基本信息（设备编号、资产号、安装位置、备注）
${web_PLATFORM_HUMITURE_DETAIL_EDIT_NUMBER}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[1]/div[1]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ASSETNUMBER}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[1]/div[2]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_DISTANCE}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[4]/div[1]/select
${web_PLATFORM_HUMITURE_DETAIL_EDIT_FLOOR}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[4]/div[2]/select
${web_PLATFORM_HUMITURE_DETAIL_EDIT_POSITION}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[5]/div[1]/select
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ROOMLOC}   xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[5]/div[2]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_INSTALLOC}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[7]/div[1]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_REMARK}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[8]/div[1]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_OVER}  xpath://html/body/div[1]/div[4]/div/div/div[4]/div/div[2]/div/div[2]/a[4]

${WEB_PLATFORM_ORG_PARENTNAME}  xpath://*[@id="parentName"]
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_NEXT}  xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[2]/a[2]
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_LONGITUDE}  xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[1]/div[2]/div/div[2]/ul/li[1]/div[1]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_LATITUDE}   xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[1]/div[2]/div/div[2]/ul/li[1]/div[2]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_CUSTOMER_NUMBER}  xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[1]/div[3]/div/div/div[2]/ul/li[1]/div[1]/input
${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_OVER}  xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[2]/a[4]
#${WEB_PLATFORM_ORG_NAME}  xpath://*[@id="parentName"]/../../../li[2]div/div
${WEB_PLATFORM_ORG_NAME}  xpath://html/body/div[1]/div[4]/div/div/div[8]/div/div[2]/div/div[1]/div[1]/div/div[2]/ul/li[2]/div[1]/div

#抄表数据
${web_PLATFORM_HUMITURE_DETAIL_MEAS_VAL}  xpath://table[@id='humitureMeterDetailMeasValGrid']/tbody/tr[2]
${web_PLATFORM_HUMITURE_DETAIL_SEL_MEAS_VAL}  xpath://table[@id='humitureMeterDetailMeasValGrid']/tbody/tr[@aria-selected='true']

#设置列保存按钮
${web_PLATFORM_HUMITURE_DETAIL_HIDE_COLUMN_CONFIRM}  xpath://html/body/div[1]/div[10]/div/div[2]/div[3]/a[1]
${web_PLATFORM_HUMITURE_DETAIL_HIDE_COLUMN}  id:jqgh_humitureMeterDetailMeasValGrid_alarmInfo

#筛选 排序
${web_PLATFORM_HUMITURE_INPUT_SEARCH_NUM}  id:gs_meterNumber
${web_PLATFORM_HUMITURE_SEL_POSITION}  id:gs_positionName
${web_PLATFORM_HUMITURE_SEL_POSITION_LIST}   xpath://td[@aria-describedby="humitureGrid_positionName"]
*** Keywords ***

#   添加、编辑、删除按钮
Click button
    [Arguments]  ${type}
    Click common button   ${humiture_PADER}  ${type}
    sleep  2s
#  添加按钮
Click bottom add
    ${add_button_ele}     Get bottom button    ${humiture_PADER}  添加
    click element when is enabled   ${add_button_ele}
    sleep  2s
#设备编号
Set humiture_number
    [Arguments]  ${humitureNumber}
    input text  ${web_PLATFORM_HUMITURE_NUMBER}  ${humitureNumber}
#    仪表资产号
Set humiture_assetNumber
    [Arguments]  ${assetNumber}
    input text  ${web_PLATFORM_HUMITURE_ASSETNUMBER}  ${assetNumber}
#    距热源
Set humiture_distance
    [Arguments]  ${distance_num}
    select from list by index  ${web_PLATFORM_HUMITURE_DISTANCE}  ${distance_num}
    sleep  1s
#    楼层
Set humiture_floor
    [Arguments]  ${floor_num}
    select from list by index  ${web_PLATFORM_HUMITURE_FLOOR}  ${floor_num}
    sleep  1s
#    位置
Set humiture_position
    [Arguments]  ${position_num}
    select from list by index  ${web_PLATFORM_HUMITURE_POSITION}  ${position_num}
#    房间位置
Set humiture_roomloc
    [Arguments]  ${room_LOC}
    input text  ${web_PLATFORM_HUMITURE_ROOMLOC}  ${room_LOC}
#    安装时间
Select humiture_installTime
    click element  ${web_PLATFORM_HUMITURE_INSTALLTIME}
    click element  //a[@id='laydate_today']
#    安装位置
Set humiture_instalLOC
    [Arguments]  ${instalLoc}
    input text  ${web_PLATFORM_HUMITURE_INSTALLOC}  ${instalLoc}
#    备注
Set humiture_remark
    [Arguments]  ${remark}
    input text  ${web_PLATFORM_HUMITURE_REMARK}  ${remark}
#   向导下一步
Click humiture_nextButton
    click element when is enabled  ${web_PLATFORM_Humiture_GUIDENEXT}
    sleep  2s
#   经度
Set humiture_longitude
    [Arguments]  ${longitude}
    input text  ${web_PLATFORM_HUMITURE_LONGITUDE}  ${longitude}
#    纬度
Set humiture_latitude
    [Arguments]  ${latitude}
    input text  ${web_PLATFORM_HUMITURE_LATITUDE}  ${latitude}
#    完成按钮
Click humiture_over
    click element when is enabled   ${web_PLATFORM_HUMITURE_GUIDEOVER}
    sleep  2s
#    设置温湿器信息(有分组)
Set humiture_info
    [Arguments]  ${assetNumber}  ${distance_num}  ${floor_num}  ${position_num}  ${room_LOC}  ${instalLOC}  ${remark}
    Set humiture_assetNumber  ${assetNumber}
    sleep  1s
    Set humiture_distance  ${distance_num}
    Set humiture_floor  ${floor_num}
    #Select humiture_installTime
    Set humiture_position  ${position_num}
    Set humiture_roomloc  ${room_LOC}
    Set humiture_instalLOC  ${instalLOC}
    Set humiture_remark  ${remark}
#    设置温湿器信息(有分组)
Set humiture_noGroyp_info
    [Arguments]  ${assetNumber}   ${instalLOC}  ${remark}
    Set humiture_assetNumber  ${assetNumber}
    #Select humiture_installTime
    Set humiture_instalLOC  ${instalLOC}
    Set humiture_remark  ${remark}
# 排序
Click on the header to sort
    [Arguments]  ${humiture_title}
    click element when is enabled  //th[contains(@id,"${humiture_title}")]
    sleep  2s
#   判断信息存在
Assess humiture contain
    [Arguments]    ${text}    ${loglevel}=INFO
    Page Should Contain    ${text}    ${loglevel}

#   判断信息不存在
Assess humiture not_contain
    [Arguments]    ${text}    ${loglevel}=INFO
    Page Should Not Contain    ${text}    ${loglevel}
#   获取温湿器数量
Get humiture Count
    ${count}  get text  ${web_PLATFORM_HUMITURE_COUNT}
    [Return]  ${count}
#    获取列表的第一条温湿器编号
Get exist_humiture_number
    ${exist_number}  get text  ${web_PLATFORM_HUMITURE_EXIST_NUMBER}
    [Return]  ${exist_number}
#  点击列表的第一条温湿器
Click humiture_list_number
    click element when is enabled  ${web_PLATFORM_HUMITURE_EXIST_NUMBER}
# 展开详情页的组织信息
Click humiture_org_quickUpdate
    click element when is enabled  ${web_PLATFORM_HUMITURE_SHOW_ORG_INFO}
#   获取列表的第一条信息
Get humiture_list_info
    ${List_number}  get text  ${web_PLATFORM_HUMITURE_EXIST_NUMBER}
    #${list_install_time}  get text  ${web_PLATFORM_HUMITURE_LIST_INSTALLTIME}
    ${list_install_loc}  get text  ${web_PLATFORM_HUMITURE_LIST_INSTALLLOC}
    ${list_room_loc}  get text  ${web_PLATFORM_HUMITURE_LIST_ROOMLOC}
    ${list_distance}  get text  ${web_PLATFORM_HUMITURE_LIST_DISTANCE}
    @{List_info} =  Create List  ${List_number}  ${list_install_loc}  ${list_room_loc}  ${list_distance}
    [Return]  @{List_info}
#   获取详情页的信息(与前一页列表对比)
Get humiture_Detail_info
    ${Detail_number}  get text  ${web_PLATFORM_HUMITURE_DETAIL_NUMBER}
    #${Detail_install_time}  get text  ${web_PLATFORM_HUMITURE_DETAIL_INSTALLTIME}
    ${Detail_install_loc}  get text  ${web_PLATFORM_HUMITURE_DETAIL_INSTALLLOC}
    ${Detail_room_loc}  get text  ${web_PLATFORM_HUMITURE_DETAIL_ROOMLOC}
    ${Detail_distance}  get text  ${web_PLATFORM_HUMITURE_DETAIL_DISTANCE}
    @{Detail_info} =  Create List  ${Detail_number}   ${Detail_install_loc}  ${Detail_room_loc}  ${Detail_distance}
    [Return]  @{Detail_info}

#   详情页基本信息编辑按钮
Click humiture_detail_baseinfo_edit
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_BASEINFO_EDIT}
#   详情页编辑页，输入设备编号
Set humiture_detail_edit_input_Number
    [Arguments]  ${humitureNumber}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_NUMBER}  ${humitureNumber}
#    详情页编辑页，输入仪表资产号
Set humiture_detail_edit_input_assetNumber
    [Arguments]  ${assetNumber}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ASSETNUMBER}  ${assetNumber}
#    详情页编辑页，选择距热点
Set humiture_detail_edit_sel_distance
    [Arguments]  ${distance_num}
    select from list by index  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_DISTANCE}  ${distance_num}
#    详情页编辑页，选择楼层
Set humiture_detail_edit_sel_floor
    [Arguments]  ${floor_num}
    select from list by index  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_FLOOR}  ${floor_num}
#    详情页编辑页，选择位置
Set humiture_detail_edit_sel_position
    [Arguments]  ${position_num}
    select from list by index  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_POSITION}  ${position_num}
#    详情页编辑页，输入房间位置
Set humiture_detail_edit_input_roomloc
    [Arguments]  ${roomLoc}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ROOMLOC}  ${roomLoc}
#    详情页编辑页，输入安装位置
Set humiture_detail_edit_input_instalLOC
    [Arguments]  ${instalLoc}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_INSTALLOC}  ${instalLoc}
#    详情页编辑页，输入备注
Set humiture_detail_edit_input_remark
    [Arguments]  ${remark}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_REMARK}  ${remark}
#    详情页编辑基本信息完成按钮
Click humiture_detail_edit_Over
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_OVER}
#    详情页编辑温湿器基本信息(未分组)
Set humiture_detail_baseinfo
    [Arguments]  ${number}  ${assetNumber}   ${instalLOC}  ${remark}
    Set humiture_detail_edit_input_Number  ${number}
    Set humiture_detail_edit_input_assetNumber  ${assetNumber}
    #Select humiture_detail_installTime
    Set humiture_detail_edit_input_instalLOC  ${instalLOC}
    Set humiture_detail_edit_input_remark  ${remark}
#    设置详情页编辑温湿器基本信息(有组织)
Set humiture_detail_baseinfo_org
    [Arguments]  ${number}  ${assetNumber}  ${distance_num}  ${floor_num}  ${position_num}  ${room_LOC}  ${instalLOC}  ${remark}
    Set humiture_detail_edit_input_Number  ${number}
    Set humiture_detail_edit_input_assetNumber  ${assetNumber}
    Set humiture_detail_edit_sel_distance  ${distance_num}
    Set humiture_detail_edit_sel_floor  ${floor_num}
    #Select humiture_detail_installTime
    Set humiture_detail_edit_sel_position  ${position_num}
    Set humiture_detail_edit_input_roomloc  ${room_LOC}
    Set humiture_detail_edit_input_instalLOC  ${instalLOC}
    Set humiture_detail_edit_input_remark  ${remark}
#   获取详情页的基本信息(未分组、有组织)
Get humiture_detail_baseinfo_by_org
    [Arguments]  ${type}
    ${Detail_number}  get text  ${web_PLATFORM_HUMITURE_DETAIL_NUMBER}   #设备编号
    ${Detail_distance}  get text  ${web_PLATFORM_HUMITURE_DETAIL_DISTANCE}   #距热点
    ${Detail_floor}  get text  ${web_PLATFORM_HUMITURE_DETAIL_FLOOR}   #楼层
    ${Detail_position}  get text  ${web_PLATFORM_HUMITURE_DETAIL_POSITION}   #位置
    ${Detail_room_loc}   get text  ${web_PLATFORM_HUMITURE_DETAIL_ROOMLOC}   #房间位置
    ${Detail_install_loc}  get text  ${web_PLATFORM_HUMITURE_DETAIL_INSTALLLOC}  #安装位置
    #${Detail_install_time}  get text  ${web_PLATFORM_HUMITURE_DETAIL_INSTALLTIME} #安装时间
    ${Detail_remark}  get text  ${web_PLATFORM_HUMITURE_DETAIL_REMARK}  #备注
    @{Detail_baseinfo} =  Create List  ${Detail_number}  ${Detail_install_loc}  ${Detail_remark}
    @{Detail_info} =  Create List  ${Detail_number}  ${Detail_distance}  ${Detail_floor}  ${Detail_position}  ${Detail_room_loc}  ${Detail_install_loc}  ${Detail_remark}
    run keyword if  '${type}'=='noGroup'   Return From Keyword  @{Detail_baseinfo}
    ...  ELSE IF  '${type}'=='org'   Return From Keyword  @{Detail_info}

#  未分组温湿器详情页 获取组织快捷编辑按钮的属性值
Get humiture_detail_noGroup_quickUpdate_Attribute
    ${edit_attribute}  get_element_attribute  ${web_PLATFORM_HUMITURE_ORG_QUICK_UPDATE_BUTTON}  class
    [Return]  ${edit_attribute}
    #[Arguments]  ${edit}
    #${a}  Run_keyword_and_return_status  Page Should Contain Element  ${edit}

#   详情页组织信息编辑按钮
Click humiture_detail_org_quick_button
    click element when is enabled  ${web_PLATFORM_HUMITURE_ORG_QUICK_UPDATE_BUTTON}

#    组织树选择
Set org_tree
    [Arguments]  ${orgTreeName}
    click element  ${WEB_PLATFORM_ORG_PARENTNAME}
    click element  //a[@title="${orgTreeName}"]

#    详情页编辑组织信息完成按钮
Click humiture_detail_edit_org_Over
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_OVER}

#   详情页编辑所属组织名称(未成功)
Set org_name
    [Arguments]  ${org_name}
#    input text  ${WEB_PLATFORM_ORG_NAME}  ${org_name}
    ${a}  get text  ${WEB_PLATFORM_ORG_NAME}
    log to console  ${a}
# 详情页组织信息编辑，下一步按钮
Click humiture_detail_edit_org_Next
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_NEXT}
# 详情页组织信息编辑，下一步，输入经纬度
SET humiture_detail_edit_Map
    [Arguments]  ${longitude}  ${latitude}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_LONGITUDE}  ${longitude}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_LATITUDE}   ${latitude}

#   客户编号
Set humiture_detail_edit_org_cus_num
    [Arguments]  ${cusNum}
    input text  ${web_PLATFORM_HUMITURE_DETAIL_EDIT_ORG_CUSTOMER_NUMBER}  ${cusNum}

#   点击选中一条抄表数据
Click sel meas_val
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_MEAS_VAL}

#   抄表数据刷新、导出、设计列
Click meas_val_pager_left
    [Arguments]    ${button_title}
    click element when is enabled  //*[@id='humitureMeterDetailMeasValPager_left']/table/tbody/tr/td[@title="${button_title}"]

#  温湿器详情页 判断抄表数据选中状态
humiture detail unsel meas_val
    Page Should Not Contain Element  ${web_PLATFORM_HUMITURE_DETAIL_SEL_MEAS_VAL}

#  隐藏列
humiture detail meas_val set column
    [Arguments]   ${column_title}
    click element when is enabled  //div[@class='name ng-binding' and contains(text(),"${column_title}")]
    click element when is enabled  //div[@class='name ng-binding' and contains(text(),"${column_title}")]/../a

#设置列保存
humiture detail meas_val set column confirm
    click element when is enabled  ${web_PLATFORM_HUMITURE_DETAIL_HIDE_COLUMN_CONFIRM}

#  判断列隐藏成功
humiture detail column hide success
    Page Should Not Contain Element  ${web_PLATFORM_HUMITURE_DETAIL_HIDE_COLUMN}

#  输入设备资产号过滤
Input search huniture number
    [Arguments]  ${humiture_Num}
    input text  ${web_PLATFORM_HUMITURE_INPUT_SEARCH_NUM}  ${humiture_Num}

#   Enter键回车
Click Enter
    Press Key  ${web_PLATFORM_HUMITURE_INPUT_SEARCH_NUM}  \\13

#   选择位置进行过滤
Sel Position
    [Arguments]  ${position_num}
    sleep  2s
    select from list by index  ${web_PLATFORM_HUMITURE_SEL_POSITION}  ${position_num}
    sleep  2s

#  判断列表按位置过滤正确
ASSESS Sel Humiture By Position
    [Arguments]  ${position}
    Page Should Not Contain Element  //table[@id='humitureGrid']/tbody/tr/td[@title='${position}']

#  获取详情页底部的三个按钮（刷新、导出、设置列）
Get humiture Detail MeasVal Pager_left Button
    ${refresh_button}  get_element_attribute  //*[@id='humitureMeterDetailMeasValPager_left']/table/tbody/tr/td[1]   title
    ${export_button}   get_element_attribute  //*[@id='humitureMeterDetailMeasValPager_left']/table/tbody/tr/td[2]   title
    ${setting_button}  get_element_attribute  //*[@id='humitureMeterDetailMeasValPager_left']/table/tbody/tr/td[3]   title
    ${left Button List} =  Create List  ${refresh_button}  ${export_button}  ${setting_button}
    [Return]  ${left Button List}

#  获取详情页抄表数据的时间段（下拉框内有一周内、一个月内、三个月内、半年内、一年内）
Get humiture Detail MeasVal TimeRange
    ${count}    Get Element Count    //*[@id='tabs_meter_detail_energy']/select[1]/option[starts-with(@value,'string')]
    ${List_info} =  Create List
    :FOR  ${rowIndex}  IN Range  1  ${count+1}
    \   ${curText}    Get Text    //*[@id='tabs_meter_detail_energy']/select[1]/option[${rowIndex}]
    \    append to list  ${List_info}  ${curText}
    [Return]   ${List_info}

#获取列表页首页的所有仪表编号
Get humiture_number list
    ${count}    Get Element Count    xpath=//table[@id='humitureGrid']/tbody/tr/td[@aria-describedby='humitureGrid_meterNumber']
    log to console  ${count}
    ${number_list} =  Create List
    :FOR  ${rowIndex}  IN Range  1  ${count+1}
    \   ${curText}    Get Text    //table[@id='humitureGrid']/tbody/tr[${rowIndex+1}]/td[5]/span
    #\   ${curText}    Get Text    //span[@id='data_humiture_${rowIndex-1}']
    \    append to list  ${number_list}  ${curText}
    log to console  ${number_list}
    [Return]   ${number_list}
s

