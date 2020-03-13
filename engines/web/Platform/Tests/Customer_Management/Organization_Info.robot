#-*- coding: utf-8 -*-

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
${org_areaName}  zd002区域
${org_communityName}  测试小区
${org_streetName}  测试街道
${org_buildingName}  1号楼
${org_unitName}  1单元
${org_houseNumberName}  01门牌号
${org_roomName}  101
${org_ramark}  1352624
@{list}   kh002  001客户  1  2  2.6  450  210  5  15165021524  15241@125.com  test
${index}  12
${org_communityTypeId}  2
${org_streetTypeId}  3
${longitude}  117.084
${latitude}  36.662
${org_rootNode}  总公司
${org_roomCount}  10
${org_errorInfo_null}  *组织名称不能为空
${org_errorInfo_exist}  组织名称已经存在
${org_list_one_row}  jqg_organizationGrid_0
${org_delete_reason}  1
${org_delete_new_reason}  组织编写错误

*** Test Cases ***
IP-6014: orgName is null
    Given User is in organization info page
    When OrgName is null
    THEN Platform_OrganizationPage.Add organization success  ${org_errorInfo_null}
    [Teardown]  Close the bounced

IP-6015: add area organization
    Given User is in organization info page
    When Add area organization
    Then Add organization success  ${org_areaName}
    [Teardown]  Deleted current page organization

IP-6016: add community organization
    Given User is in organization info page
    When Add community organization
    Then Add organization success  ${org_communityName}
    [Teardown]  Deleted current page organization

IP-6017: add street organization
    Given User is in organization info page
    When Add street organization
    Then Add organization and customer success  ${org_streetName}
    [Teardown]  Deleted organization and customer

IP-6018: add community organization in area
    Given User is in organization info page
    When Add community organization in area
    Then Add organization success  ${org_communityName}
    [Teardown]  Deleted root node organization

IP-6019: add street organization in area
    Given User is in organization info page
    When Add street organization in area
    Then Add organization success  ${org_streetName}
    [Teardown]  Deleted child node organization

IP-6020: add build organization in community
    Given User is in organization info page
    When Add build organization in community
    Then Add organization success  ${org_buildingName}
    [Teardown]  Deleted child node organization

IP-6021: add unit organization in build
    Given User is in organization info page
    When Add unit organization in build
    Then Add organization success  ${org_unitName}
    [Teardown]  Deleted child node organization

IP-6022: add room organization in unit
    Given User is in organization info page
    When Add room organization in unit
    Then Add organization and customer success  ${org_communityName}
    [Teardown]  Deleted child node organization and customer

IP-6170: add houseNumber organization in street
    Given User is in organization info page
    When Add houseNumber organization in street
    Then Add organization success  ${org_houseNumberName}
    [Teardown]  Deleted child node organization

IP-6171: add room organization in houseNumber
    Given User is in organization info page
    When Add room organization in houseNumber
    Then Add organization success  ${org_roomName}
    [Teardown]  Deleted child node organization

IP-6024: add sameName organization
    Given User is in organization info page
    When Add sameName organization
    Then Platform_OrganizationPage.Add organization success  ${org_errorInfo_exist}
    [Teardown]  Close the bounced

IP-6030: edit same name organization
    Given User is in organization info page
    When Edit same name organization
    Then Platform_OrganizationPage.Add organization success  ${org_errorInfo_exist}

IP-6031: edit upper organization
    Given User is in organization info page
    When Edit upper organization
    Then Edit organization success  ${org_communityName}

IP-6032: edit organization name
    Given User is in organization info page
    When Edit organization name
    Then Edit organization success  121小区
    [Teardown]  Deleted child node organization

IP-6033: edit organization otherInfo
    Given User is in organization info page
    When Edit organization otherInfo
    Then Edit organization success  ${org_streetName}
    [Teardown]  Deleted child node organization
#
IP-6034: edit organization and customer
    Given User is in organization info page
    When Edit organization and customer
    Then Add organization and customer success  ${org_areaName}  @{list}[0]
    [Teardown]  Deleted organization and customer

*** Keywords ***
#   进入到组织信息界面
User is in organization info page
    wait for loading page
    Platform_TopMenu.Get into organization page

#    组织为空
OrgName is null
    wait for loading page
    Platform_OrganizationPage.Click bottom button add
    Platform_OrganizationPage.Click element button complete

#    错误提醒
OrgName error show
    Platform_OrganizationPage.Add organization success  *组织名称不能为空

#    关闭弹框
Close the bounced
    Platform_OrganizationPage.Click element button

#    添加区域组织
Add area organization
    wait for loading page
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_areaName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click element button complete

#    添加根节点小区组织
Add community organization
    wait for loading page
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Add organization first step  ${org_communityName}  ${org_communityTypeId}  ${org_ramark}
    Platform_OrganizationPage.Click element button neat
#    输入经纬度
    Platform_OrganizationPage.Set org_lon_lat  ${longitude}  ${latitude}
    Platform_OrganizationPage.Click element button complete

#    添加根节点街道组织
Add street organization
    wait for loading page
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Add organization first step  ${org_streetName}  ${org_streetTypeId}  ${org_ramark}
    Platform_OrganizationPage.Click element button neat
#    输入经纬度
    Platform_OrganizationPage.Set org_lon_lat  ${longitude}  ${latitude}
    Platform_OrganizationPage.Click element button neat
#    向导第二步
    Set cus_info  @{list}[0]  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]  @{list}[7]  @{list}[8]  @{list}[9]  @{list}[10]
    Platform_OrganizationPage.Click button orgComplete

#   添加区域下小区
Add community organization in area
#   先添加区域
    Add area organization
#    选中左侧树区域组织
    Select unGroup left tree button  ${org_areaName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_communityName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click element button neat
#    输入经纬度
    Platform_OrganizationPage.Set org_lon_lat  ${longitude}  ${latitude}
    Platform_OrganizationPage.Click element button complete

#    添加区域下街道
Add street organization in area
#   先添加区域
    Add area organization
#    选中左侧树区域组织
    Select unGroup left tree button  ${org_areaName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_streetName}
    Platform_OrganizationPage.Select org_type  ${org_communityTypeId}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click button orgComplete

#    添加小区下面的楼
Add build organization in community
#    先添加小区
    Add community organization
#    选中左侧树小区组织
    Select unGroup left tree button  ${org_communityName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_buildingName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click element button neat
#    输入经纬度
    Platform_OrganizationPage.Set org_lon_lat  ${longitude}  ${latitude}
    Platform_OrganizationPage.Click element button complete

#    添加楼下面的单元
Add unit organization in build
    Add build organization in community
    Select unGroup left tree button  ${org_buildingName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_unitName}
    Platform_OrganizationPage.Set org_roomCount  ${org_roomCount}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click button orgComplete

#    添加单元下面的房间号
Add room organization in unit
    Add unit organization in build
    Select unGroup left tree button  ${org_unitName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_roomName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click element button neat
#    添加客户
    Set cus_info  @{list}[0]  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]  @{list}[7]  @{list}[8]  @{list}[9]  @{list}[10]
    Platform_OrganizationPage.Click button orgComplete

#    添加街道下面的门牌号
Add houseNumber organization in street
    Add street organization in area
    Select unGroup left tree button  ${org_streetName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_houseNumberName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click button orgComplete

#   添加门牌号下面的房间号
Add room organization in houseNumber
    Add houseNumber organization in street
    Select unGroup left tree button  ${org_houseNumberName}
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  ${org_roomName}
    Platform_OrganizationPage.Set org_ramark  ${org_ramark}
    Platform_OrganizationPage.Click button orgComplete

#    添加组织名称重复
Add sameName organization
    Add community organization in area
    Select unGroup left tree button  ${org_areaName}
    Platform_OrganizationPage.Click bottom button add
    Platform_OrganizationPage.Set org_name  ${org_communityName}
    Platform_OrganizationPage.Click button orgComplete

#    选中某一行
Deleted current page organization
    Select list one row  jqg_organizationGrid_0
    Platform_OrganizationPage.Click bottom button deleted
#    选择删除原因
    Set deletde reason  1
    Click delete confirm button

#    删除根节点下单个组织
Deleted root node organization
#   选中左侧树
    Select unGroup left tree button  ${org_rootNode}
    wait for loading page
    Deleted current page organization

#    删除根节点下包含子节点的组织
Deleted child node organization
#   选中左侧树
    Select unGroup left tree button  ${org_rootNode}
    wait for loading page
    Deleted current page organization
    Platform_OrganizationPage.Click next delete confirm button

#    删除根节点下包含子节点以及关联客户的组织
Deleted child node organization and customer
    Platform_TopMenu.Get into organization page
    Deleted child node organization
    Platform_OrganizationPage.Click next delete confirm button

#    添加组织成功
Add organization success
    [Arguments]  ${orgName}
    wait for loading page
    Platform_OrganizationPage.Add organization success  ${orgName}
    sleep  1s

#   验证组织跟客户是否追加成功
Add organization and customer success
    [Arguments]   ${org_name}
    Platform_CustomerPage.Add customer success  客户@{list}[0]添加成功！
    sleep  2s
    Platform_OrganizationPage.Add organization success  ${org_name}
    sleep  2s
    Platform_CustomerPage.Add customer success from organization  ${org_name}  @{list}[0]

#    编辑组织信息
Edit organization
    wait for loading page
#    选中某一行
    Select list one row  jqg_organizationGrid_0
    Platform_OrganizationPage.Click bottom button edit
#    Platform_OrganizationPage.Click button_confirm
    Platform_OrganizationPage.Set org_name  zdh测试修改
#    Platform_OrganizationPage.Set org_ztree  orgTableEditOrgTree_2_a
    Platform_OrganizationPage.Set org_ramark  testtest
    Platform_OrganizationPage.click element button neat
#    向导第二步
    Set cus_info  kh001——xg  001客户  2  1  2.5  350  260  5  13156452152  15241@163.com  test---xxx
    Platform_OrganizationPage.Click button orgComplete

#    删除组织和客户
Deleted organization and customer
    Platform_TopMenu.Get into organization page
    wait for loading page
    Deleted current page organization
    Platform_OrganizationPage.Click next delete confirm button

#    编辑组织重复的组织名称
Edit same name organization
    Add community organization in area
    Select unGroup left tree button  ${org_areaName}
    Platform_OrganizationPage.Click bottom button add
    Platform_OrganizationPage.Set org_name  测试小区2
    Platform_OrganizationPage.Click button orgComplete
    wait for loading page
    Select list one row  ${org_list_one_row}
    Platform_OrganizationPage.Click bottom button edit
    Click warm delDialog_confirm
    Platform_OrganizationPage.Set org_name  ${org_communityName}
    Platform_OrganizationPage.Click button orgComplete

#   修改上层组织
Edit upper organization
    Add community organization in area
    Select unGroup left tree button  ${org_areaName}
    wait for loading page
    Select list one row  ${org_list_one_row}
    Platform_OrganizationPage.Click bottom button edit
    Click warm delDialog_confirm
    Platform_OrganizationPage.Set org_ztree  orgTableEditOrgTree_1_a
    Platform_OrganizationPage.Click button orgComplete

#    修改组织名称
Edit organization name
    Add community organization in area
    Select unGroup left tree button  ${org_areaName}
    wait for loading page
    Select list one row  ${org_list_one_row}
    Platform_OrganizationPage.Click bottom button edit
    Click warm delDialog_confirm
    Platform_OrganizationPage.Set org_name  121小区
    Platform_OrganizationPage.Click button orgComplete

#   修改其他信息
Edit organization otherInfo
    Add street organization in area
    Select unGroup left tree button  ${org_areaName}
    wait for loading page
    Select list one row  ${org_list_one_row}
    Platform_OrganizationPage.Click bottom button edit
    Click warm delDialog_confirm
    Platform_OrganizationPage.Set org_ramark  修改test
    Platform_OrganizationPage.Click element button neat
#    输入经纬度
    Platform_OrganizationPage.Set org_lon_lat  ${longitude}  ${latitude}
    Platform_OrganizationPage.Click button orgComplete

#    编辑客户
Edit organization and customer
    Add area organization
    wait for loading page
    Select list one row  ${org_list_one_row}
    Platform_OrganizationPage.Click bottom button edit
    wait for loading page
    Click warm delDialog_confirm
    Platform_OrganizationPage.Click element button neat
    Set cus_info  @{list}[0]  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]  @{list}[7]  @{list}[8]  @{list}[9]  @{list}[10]
    Platform_OrganizationPage.Click button orgComplete

#    验证组织编辑成功
Edit organization success
    [Arguments]  ${org_name}
    wait for loading page
    Platform_OrganizationPage.Add organization success  ${org_name}



